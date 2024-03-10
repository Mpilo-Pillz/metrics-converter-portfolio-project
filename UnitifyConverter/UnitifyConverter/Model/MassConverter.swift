//
//  MassConverter.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/07.
//

import Foundation

struct MassConverter: Convertible {
    
    let measurementUnits = ["Mass", "Length", "Consumption"]
    
    var units: [Unit] = [
        Unit(name: "Kilograms kg", conversionFactor: 1.0, unitType: .mass), // Base unit for mass
        Unit(name: "Pounds lb", conversionFactor: 0.453592, unitType: .mass), // Pounds to kg
        Unit(name: "Grams g", conversionFactor: 0.001, unitType: .mass) // Grams to kg
    ]
    
    func convert(value: Double, fromUnit: Unit, toUnit: Unit) -> Double?  {
        guard fromUnit.unitType == toUnit.unitType else {
            print("Conversion between different unit types is not allowed.")
            return nil
        }
        
        // Direct conversion if converting within the same unit or to the base unit
        if fromUnit.name == "Kilograms kg" && toUnit.name == "Pounds lb" {
            // Converting from kg to lbs
            return value * 2.20462
        } else if fromUnit.name == "Pounds lb" && toUnit.name == "Kilograms kg" {
            // Converting from lbs to kg
            return value * 0.453592
        } else if fromUnit.name == "Grams g" && toUnit.name == "Kilograms kg" {
            // Converting from g to kg
            return value / 1000
        } else if fromUnit.name == "Kilograms kg" && toUnit.name == "Grams g" {
            // Converting from kg to g
            return value * 1000
        } else {
            // Handle other conversions similarly, adjusting the conversion factor as needed
            return nil
        }
    }
}
