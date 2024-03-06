//
//  Converter.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import Foundation

enum UnitType {
    case mass
    case distance
    case length
    case fuelConsumption
}

struct Unit: Nameable {
    let name: String
    let conversionFactor: Double
    let unitType: UnitType
}

struct Converter {
    let fromUnit: Unit
    let toUnit: Unit
    
    
    func convert(value: Double) -> Double? {
        guard fromUnit.unitType == toUnit.unitType else {
            print("Conversion between different unit types is not allowed.")
            return nil
        }
        
        
        if fromUnit.conversionFactor == 1.0 {
            
            return value * toUnit.conversionFactor
        } else if toUnit.conversionFactor == 1.0 {
            
            return   fromUnit.conversionFactor / value
        } else {
            
            let valueInBaseUnit = value / fromUnit.conversionFactor
            return valueInBaseUnit * toUnit.conversionFactor
        }
    }
}
