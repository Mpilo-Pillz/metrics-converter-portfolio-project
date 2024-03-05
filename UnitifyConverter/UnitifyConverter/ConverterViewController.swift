//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController  {
    
    let measurementTypes = ["Mass", "Length", "Consumption"]

//    var units = [Unit(name: "Kilograms kg", conversionFactor: 1.0, unitType: UnitType.mass), Unit(name: "Pounds lb", conversionFactor: 2.20462, unitType: UnitType.mass), Unit(name: "Grams g", conversionFactor: 0.001, unitType: UnitType.mass)]
//    453.592
    
    var units = [
        Unit(name: "Kilograms kg", conversionFactor: 1.0, unitType: .mass), // Base unit for mass
        Unit(name: "Pounds lb", conversionFactor: 0.453592, unitType: .mass), // Pounds to kg
        Unit(name: "Grams g", conversionFactor: 0.001, unitType: .mass) // Grams to kg
    ]
    
    var selectedFromUnit: Unit?
    var selectedToUnit: Unit?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var measurementTypesPicker: UIPickerView!
    @IBOutlet weak var fromUnitPicker: UIPickerView!
    @IBOutlet weak var toUnitPicker: UIPickerView!
    
    var measurementTypePickerViewHandler: PickerViewHandler!
    var fromUnitPickerViewHandler: PickerViewHandler!
    var toUnitPickerViewHandler: PickerViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePickerViews()
        
        selectedFromUnit = units.first
        selectedToUnit = units.first
    }
    
    private func configurePickerViews() {
        measurementTypePickerViewHandler = PickerViewHandler(items: measurementTypes, delegate: self)
        
        fromUnitPickerViewHandler = PickerViewHandler(items: getStringsFromMap(from: units), delegate: self)
        toUnitPickerViewHandler = PickerViewHandler(items: getStringsFromMap(from: units), delegate: self)
        
        
        measurementTypesPicker.dataSource = measurementTypePickerViewHandler
        measurementTypesPicker.delegate = measurementTypePickerViewHandler
        fromUnitPicker.delegate = fromUnitPickerViewHandler
        fromUnitPicker.dataSource = fromUnitPickerViewHandler
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
        
        let converter = Converter(fromUnit: fromUnit, toUnit: toUnit)
                let result = converter.convert(value: fromValue)
        
//        resultLabel.text = "\(result)"
        
        guard let value = result else {
            resultLabel.text = "Default Value or Leave Empty"
            return
        }
        resultLabel.text = "\(value)"
        
    }
}

extension ConverterViewController: PickerViewHandlerDelegate {
    func didSelectItem(_ handler: PickerViewHandler, selectedItem: String) {
                
        if handler === measurementTypePickerViewHandler {
                   print("TODO filterList")
               } else if handler === fromUnitPickerViewHandler {
                   selectedFromUnit = units.first {$0.name == selectedItem}
               } else if handler === toUnitPickerViewHandler {
                   selectedToUnit = units.first {$0.name == selectedItem}
               }
    }
}
