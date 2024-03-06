//
//  ViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/02/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        convertPoundsToKilograms(pounds: 145)
        print("[----------------------------]")
        kilometersPerLiter(from: 15.1)
        print("[----------------------------]")
        convertMilesToKm(miles: 2)
        print("[-------------kg->pound---------------]")
        convertKilogramsToPounds(kilograms: 65)
        convertKilogramsToPounds2(kilograms: 65)
        convertPoundsToKilograms2(pounds: 145)
    }
    
    func convertPoundsToKilograms(pounds: Double) {
        let kilograms = pounds * 0.453592
        print("kilograms - \(kilograms)")
    }
    
    func convertKilogramsToPounds(kilograms: Double) {
        let pounds = kilograms / 0.453592
        print("pounds - \(pounds)")
    }
    
    func convertPoundsToKilograms2(pounds: Double) {
        let kilograms = pounds / 2.205
        print("kilograms2 - \(kilograms)")
    }
    
    func convertKilogramsToPounds2(kilograms: Double) {
        let pounds = kilograms * 2.205
        print("pounds2 - \(pounds)")
    }
    
//    7.1l/100 -> ?liters / km
    
    func kilometersPerLiter(from litersPerHundredkm: Double) {
        let kmPerLiter = 100 / litersPerHundredkm
         print(kmPerLiter)
    }
    
    func convertMilesToKm(miles: Double) {
        let kilometer = miles * 1.609
        print(kilometer)
    }
}

