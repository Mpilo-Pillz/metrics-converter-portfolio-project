//
//  Convertible.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/07.
//

import Foundation

protocol Convertible {
    func convert(value: Double,fromUnit: String, toUnit: String) -> Double?
}
