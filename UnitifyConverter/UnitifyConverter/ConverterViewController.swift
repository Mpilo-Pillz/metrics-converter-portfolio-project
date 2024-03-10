//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController  {
    
    let massConverter = MassConverter()
    let defaultUnitType: UnitType = UnitType.allCases.first ?? .mass
    
    var selectedFromUnit: Unit? // TODO revisit
    var selectedToUnit: Unit? // TODO revisit
    
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
        //        selectedFromUnit = units.first
        //        selectedToUnit = units.first
    }
    
    private func configurePickerViews() {
        measurementTypePickerViewHandler = PickerViewHandler(items: UnitType.allCases.map { $0.rawValue }, delegate: self)
        fromUnitPickerViewHandler = PickerViewHandler(items: getUnitsOrReturnEmptyArray(defaultUnitType), delegate: self)
        toUnitPickerViewHandler = PickerViewHandler(items: getUnitsOrReturnEmptyArray(defaultUnitType), delegate: self)
        
        measurementTypesPicker.dataSource = measurementTypePickerViewHandler
        measurementTypesPicker.delegate = measurementTypePickerViewHandler
        fromUnitPicker.delegate = fromUnitPickerViewHandler
        fromUnitPicker.dataSource = fromUnitPickerViewHandler
        toUnitPicker.delegate = toUnitPickerViewHandler
        toUnitPicker.dataSource = toUnitPickerViewHandler
        
        measurementTypesPicker.selectRow(0, inComponent: 0, animated: false)
        
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
    
    fileprivate func getUnitsOrReturnEmptyArray(_ unitType: UnitType) -> [String] {
        return conversions[unitType]?.units ?? []
    }
    
    func didSelectItem(_ handler: PickerViewHandler, selectedItem: String) {
        if handler === measurementTypePickerViewHandler {
            // User selected a unit type, update the units picker
            if let unitType = UnitType(rawValue: selectedItem) {
                fromUnitPickerViewHandler?.items = getUnitsOrReturnEmptyArray(unitType)
                toUnitPickerViewHandler?.items = getUnitsOrReturnEmptyArray(unitType)
                fromUnitPicker.reloadAllComponents()
                toUnitPicker.reloadAllComponents()
            }
        } else if handler === fromUnitPickerViewHandler {
            
            //                   selectedFromUnit = units.first {$0.name == selectedItem}
        }
        else if handler === toUnitPickerViewHandler {
            //            selectedToUnit = units.first {$0.name == selectedItem}
        }
    }
}
