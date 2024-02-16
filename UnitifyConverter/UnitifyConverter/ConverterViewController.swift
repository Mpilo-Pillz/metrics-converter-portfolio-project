//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController {
    
    let measurementTypes = ["Mass", "Length", "Consumption"]
    
    @IBOutlet weak var measurementTypesPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        measurementTypesPicker.dataSource = self
        measurementTypesPicker.delegate = self
        // Do any additional setup after loading the view.
    }


   

}

extension ConverterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return measurementTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return measurementTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       print("TODO implement")
        print(measurementTypes[row])
    }
}
