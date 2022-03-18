//
//  SliderValues.swift
//  RGBLabel
//
//  Created by Евгения Шевцова on 19.03.2022.
//

import Foundation

struct SliderValues {
    var redSlider: Float
    var greenSlider: Float
    var blueSlider: Float
    
    static func getSliderValue() -> SliderValues {
        SliderValues(
            redSlider: 0.5,
            greenSlider: 0.5,
            blueSlider: 0.5)
    }
}
