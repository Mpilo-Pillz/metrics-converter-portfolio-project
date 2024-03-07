//
//  Convertible.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/07.
//

import Foundation
protocol Convertible {
   var units: [Unit] { get }
    
    func convert(value: Double,fromUnit: Unit, toUnit: Unit) -> Double?
}
