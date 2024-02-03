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
    }
    
    func convertPoundsToKilograms(pounds: Double) {
        let kilograms = pounds * 0.453592
        print("kilograms - \(kilograms)")
    }
}

