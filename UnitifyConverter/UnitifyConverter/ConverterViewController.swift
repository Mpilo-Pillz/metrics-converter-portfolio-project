//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController  {
    
    
    let massConverter = MassConverter()
    
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
        measurementTypePickerViewHandler = PickerViewHandler(items: massConverter.measurementUnits, delegate: self)
        
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
        
        let result = massConverter.convert(value: fromValue, fromUnit: fromUnit, toUnit: toUnit)
                
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
