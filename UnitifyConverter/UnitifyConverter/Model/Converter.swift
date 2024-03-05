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
    
//    func convert(value: Double) -> Double? {
////        return (value * fromUnit.conversionFactor) / toUnit.conversionFactor
//        
//        guard fromUnit.unitType == toUnit.unitType else {
//                print("Conversion between different unit types is not allowed.")
//                return nil
//            }
//        
//        if fromUnit.conversionFactor == 1 {
//                // Converting from base unit to non-base unit
//                return value * toUnit.conversionFactor
//            } else if toUnit.conversionFactor == 1 {
//                // Converting from non-base unit to base unit
//                return value / fromUnit.conversionFactor
//            } else {
//                // Converting between non-base units
//                // First convert fromUnit to base unit, then from base unit to toUnit
//                let valueInBaseUnit = value / fromUnit.conversionFactor
//                return valueInBaseUnit * toUnit.conversionFactor
//            }
//    }
    
    func convert(value: Double) -> Double? {
        guard fromUnit.unitType == toUnit.unitType else {
            print("Conversion between different unit types is not allowed.")
            return nil
        }
        
        // If either unit is the base unit, perform direct conversion
        if fromUnit.conversionFactor == 1 {
            // Converting from base unit to non-base unit
            return value * toUnit.conversionFactor
        } else if toUnit.conversionFactor == 1 {
            // Converting from non-base unit to base unit
            return value / fromUnit.conversionFactor
        } else {
            // Converting between non-base units
            // Convert fromUnit to base unit (Kilograms), then to toUnit
            let valueInBaseUnit = value / fromUnit.conversionFactor // Convert to base (kg)
            return valueInBaseUnit * toUnit.conversionFactor // Convert to target unit
        }
    }
}
