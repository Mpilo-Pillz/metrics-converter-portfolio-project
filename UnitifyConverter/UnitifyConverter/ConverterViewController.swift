//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController  {
    
    let measurementTypes = ["Mass", "Length", "Consumption"]
    let units = ["Kilograms", "Pounds lb", ]
    var unitsObj = [Unit(name: "Kilograms", conversionFactor: 10.0), Unit(name: "Pounds lb", conversionFactor: 100.0)]
    
    
    var selectedFromUnit: String? //Unit?
    var selectedToUnit: String? //Unit?
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var measurementTypesPicker: UIPickerView!
    @IBOutlet weak var fromUnitPicker: UIPickerView!
    @IBOutlet weak var toUnitPicker: UIPickerView!
    
    var measurementTypePickerviewHandler: PickerViewHandler!
    var fromUitPickerViewHandler: PickerViewHandler!
    var toUnitPickerViewHandler: PickerViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePickerViews()
        
        selectedFromUnit = units.first
        selectedToUnit = units.first
    }
    
    private func configurePickerViews() {
        measurementTypePickerviewHandler = PickerViewHandler(items: measurementTypes, delegate: self)
        fromUitPickerViewHandler = PickerViewHandler(items: units, delegate: self)
        toUnitPickerViewHandler = PickerViewHandler(items: units, delegate: self)
//        fromUitPickerViewHandler = PickerViewHandler(items: getStringsFromMap(from: units), delegate: self)
//        toUnitPickerViewHandler = PickerViewHandler(items: getStringsFromMap(from: units), delegate: self)
        
        
        measurementTypesPicker.dataSource = measurementTypePickerviewHandler
        measurementTypesPicker.delegate = measurementTypePickerviewHandler
        fromUnitPicker.delegate = fromUitPickerViewHandler
        fromUnitPicker.dataSource = fromUitPickerViewHandler
        toUnitPicker.delegate = toUnitPickerViewHandler
        toUnitPicker.dataSource = toUnitPickerViewHandler
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let fromValue = Double(fromTextField.text ?? ""),
              let fromUnit = selectedFromUnit,
              let toUnit = selectedToUnit
                
                
        else {
            return
        }
        
        
        print("-->\(fromUnit)")
        print("-->\(toUnit)")
        
//        let converter = Converter(fromUnit: fromUnit, toUnit: toUnit)
        //        let result = converter.convert(value: fromValue)
        
        //        outputTextField.text = "\(result)"
        
    }
}

extension ConverterViewController: PickerViewHandlerDelegate {
    func didSelectItem(_ handler: PickerViewHandler, selectedItem: String) {
                
        if handler === measurementTypePickerviewHandler {
                   print("TODO filterList")
               } else if handler === fromUitPickerViewHandler {
                   selectedFromUnit = selectedItem
               } else if handler === toUnitPickerViewHandler {
                   
                   selectedToUnit = selectedItem
               }
    }
}
