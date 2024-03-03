//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController {
    
    let measurementTypes = ["Mass", "Length", "Consumption"]
    var units = [Unit(name: "Kilograms", conversionFactor: 10.0), Unit(name: "Pounds lb", conversionFactor: 100.0)]
    var selectedFromUnit: Unit?
    var selectedToUnit: Unit?
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var measurementTypesPicker: UIPickerView!
    @IBOutlet weak var fromUnitPicker: UIPickerView!
    @IBOutlet weak var toUnitPicker: UIPickerView!
    
    var pickerViewHandler: PickerViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        measurementTypesPicker.dataSource = self
        measurementTypesPicker.delegate = self
        
        fromUnitPicker.dataSource = self
        fromUnitPicker.delegate = self
        toUnitPicker.delegate = self
        toUnitPicker.dataSource = self
        
        selectedFromUnit = units.first
                selectedToUnit = units.first
        // Do any additional setup after loading the view.
    }


   
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let fromValue = Double(fromTextField.text ?? ""),
              let fromUnit = selectedFromUnit,
              let toUnit = selectedToUnit else {
            return
        }
        
        let converter = Converter(fromUnit: fromUnit, toUnit: toUnit)
        let result = converter.convert(value: fromValue)
        
//        outputTextField.text = "\(result)"
              
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
