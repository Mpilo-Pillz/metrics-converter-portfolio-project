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
        convertPoundsToKilograms()
    }
    
    func convertPoundsToKilograms() {
        let kilograms = 185 * 0.453592
        print("kilograms - \(kilograms)")
    }
}

