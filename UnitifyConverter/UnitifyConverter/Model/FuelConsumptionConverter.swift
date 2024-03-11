//
//  FuelConsumptionConverter.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/11.
//

import Foundation

struct FuelConversion {
    static let LITERS_PER_HUNDRED_KM = "l/100km"
    static let KILOMETERS_PER_LITER = "KM/L"
}

class FuelConsumptionConverter: Convertible {
    func convert(value: Double, fromUnit: String, toUnit: String) -> Double? {
        print("TODO - IMPLEMENT")
        return 0.0
    }
    
    
}
