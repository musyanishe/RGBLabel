//
//  ViewController.swift
//  RGBLabel
//
//  Created by Евгения Шевцова on 04.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!

    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = viewColor
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorTransferToSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValueFor(redTextField, greenTextField, blueTextField)
    }

    @IBAction func slidersAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValueFor(_ textfields: UITextField...) {
        textfields.forEach { textfield in
            switch textfield {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func colorTransferToSliders() {
        let colorTransfer = CIColor(color: viewColor)
        
        redSlider.value = Float(colorTransfer.red)
        greenSlider.value = Float(colorTransfer.green)
        blueSlider.value = Float(colorTransfer.blue)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let valueEnteredByUser = Float(newValue) else {
            showAlert(title: "Oops!", message: "Try to enter the correct format.")
            return
        }
        
        if textField == redTextField {
            redSlider.value = valueEnteredByUser
            redLabel.text = String(valueEnteredByUser)
        } else if textField == greenTextField {
            greenSlider.value = valueEnteredByUser
            greenLabel.text = String(valueEnteredByUser)
        } else {
            blueSlider.value = valueEnteredByUser
            blueLabel.text = String(valueEnteredByUser)
        }
        setColor()
    }
}

// MARK: - Alert Controller
extension SettingsViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)

        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
