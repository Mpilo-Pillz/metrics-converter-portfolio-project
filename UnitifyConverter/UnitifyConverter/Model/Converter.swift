//
//  Converter.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import Foundation
struct Unit {
    let name: String
    let conversionFactor: Double
}

struct Converter {
    let fromUnit: Unit
    let toUnit: Unit
    
    func convert(value: Double) -> Double {
        return (value * fromUnit.conversionFactor) / toUnit.conversionFactor
    }
}
