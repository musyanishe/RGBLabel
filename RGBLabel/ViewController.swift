//
//  ViewController.swift
//  RGBLabel
//
//  Created by Евгения Шевцова on 04.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redLabel.text = String(round(redSlider.value * 100) / 100)
        greenLabel.text = String(round(greenSlider.value * 100) / 100)
        blueLabel.text = String(round(blueSlider.value * 100) / 100)
    }

    @IBAction func slidersAction(_ sender: UISlider) {
        redLabel.text = String(round(redSlider.value * 100) / 100)
        greenLabel.text = String(round(greenSlider.value * 100) / 100)
        blueLabel.text = String(round(blueSlider.value * 100) / 100)
    }
}

