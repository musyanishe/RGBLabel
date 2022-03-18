//
//  SliderValues.swift
//  RGBLabel
//
//  Created by Евгения Шевцова on 19.03.2022.
//

import Foundation

struct SliderValues {
    var redSliderValue: Float
    var greenSliderValue: Float
    var blueSliderValue: Float
    
    static func getSliderValue() -> SliderValues {
        SliderValues(
            redSliderValue: 0.5,
            greenSliderValue: 0.5,
            blueSliderValue: 0.5)
    }
    
    
}
