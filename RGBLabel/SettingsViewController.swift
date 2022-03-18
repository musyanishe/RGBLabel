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
    
    private var sliderValues = SliderValues.getSliderValue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        setColor()
           setValue(for: redLabel, greenLabel, blueLabel)
    }

    @IBAction func slidersAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redLabel:
            redLabel.text = string(from: redSlider)
        case greenLabel:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
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
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(sliderValues.redSlider),
            green: CGFloat(sliderValues.greenSlider),
            blue: CGFloat(sliderValues.blueSlider),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

