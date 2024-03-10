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
    
    let conversions: [UnitType: Conversion] = [
        UnitType.mass: Conversion(units: ["kg", "lb", "g"]),
        UnitType.distance: Conversion(units: ["miles", "km", "m"]),
        UnitType.length: Conversion(units: ["m", "ft", "cm"]),
        UnitType.fuelConsumption: Conversion(units: ["km/l", "l/100km",])
    ]
    
    
    var selectedUnitType: UnitType = .mass
    
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
        
        measurementTypePickerViewHandler = PickerViewHandler(items: UnitType.allCases.map { $0.rawValue }, delegate: self)
        
        fromUnitPickerViewHandler = PickerViewHandler(items: [], delegate: self)
        toUnitPickerViewHandler = PickerViewHandler(items: [], delegate: self)
        
        
//        measurementTypePickerViewHandler = PickerViewHandler(items: massConverter.measurementUnits, delegate: self)
        
//        fromUnitPickerViewHandler = PickerViewHandler(items: getStringsFromMap(from: units), delegate: self)
//        toUnitPickerViewHandler = PickerViewHandler(items: getStringsFromMap(from: units), delegate: self)
        
        
        measurementTypesPicker.dataSource = measurementTypePickerViewHandler
        measurementTypesPicker.delegate = measurementTypePickerViewHandler
        fromUnitPicker.delegate = fromUnitPickerViewHandler
        fromUnitPicker.dataSource = fromUnitPickerViewHandler
        toUnitPicker.delegate = toUnitPickerViewHandler
        toUnitPicker.dataSource = toUnitPickerViewHandler
        
        
        
        measurementTypesPicker.selectRow(0, inComponent: 0, animated: false)
        
//        fromUnitPicker.pickerView(unitTypePicker, didSelectRow: 0, inComponent: 0)
        
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
                   // User selected a unit type, update the units picker
                   if let unitType = UnitType(rawValue: selectedItem) {
                       measurementTypePickerViewHandler?.items = conversions[unitType]?.units ?? []
                       fromUnitPicker.reloadAllComponents()
                       toUnitPicker.reloadAllComponents()
                   }
               } else if handler === fromUnitPickerViewHandler {
                   
//                   selectedFromUnit = units.first {$0.name == selectedItem}
               }
        else if handler === toUnitPickerViewHandler {
//            selectedToUnit = units.first {$0.name == selectedItem}
        }

        
        
//         if handler === measurementTypePickerViewHandler {
// //            selectedUnitType = UnitType.allCases[row]
// //            toUnitPicker.reloadAllComponents()
// //            fromUnitPicker.reloadAllComponents()
//         } else if handler === fromUnitPickerViewHandler {
//             selectedFromUnit = units.first {$0.name == selectedItem}
//         } else if handler === toUnitPickerViewHandler {
//             selectedToUnit = units.first {$0.name == selectedItem}
//         }
    }
}
