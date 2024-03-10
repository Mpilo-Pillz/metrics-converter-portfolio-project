//
//  MassConverter.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/07.
//

import Foundation

struct Mass {
    static let KILOGRAMS = "Kilograms kg"
    static let POUNDS = "Pounds lb"
    static let GRAMS = "Grams g"
}
struct MassConverter: Convertible {
    
    
    func convert(value: Double, fromUnit: String, toUnit: String) -> Double?  {
        // Direct conversion if converting within the same unit or to the base unit
        if fromUnit == Mass.KILOGRAMS && toUnit == Mass.POUNDS {
            // Converting from kg to lbs
            return value * 2.20462
        } else if fromUnit == Mass.POUNDS && toUnit == Mass.KILOGRAMS {
            // Converting from lbs to kg
            return value * 0.453592
        } else if fromUnit == Mass.GRAMS && toUnit == Mass.KILOGRAMS {
            // Converting from g to kg
            return value / 1000
        } else if fromUnit == Mass.KILOGRAMS && toUnit == Mass.GRAMS {
            // Converting from kg to g
            return value * 1000
        } else {
            // Handle other conversions similarly, adjusting the conversion factor as needed
            return nil
        }
    }
}
