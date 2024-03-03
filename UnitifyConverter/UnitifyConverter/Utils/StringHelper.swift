//
//  StringHelper.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/03.
//

import Foundation

protocol Nameable {
    var name: String { get }
}

func getStringsFromMap<T: Nameable>(from items: [T]) -> [String] {
    return items.map {$0.name}
}
