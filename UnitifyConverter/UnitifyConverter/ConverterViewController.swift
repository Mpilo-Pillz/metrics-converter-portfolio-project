//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController  {
    
    let massConverter = MassConverter()
    let fuelConsumptionConverter = FuelConsumptionConverter()
    let defaultUnitType: UnitType = UnitType.allCases.first ?? .mass
    
    var selectedFromUnit: String? // TODO revisit
    var selectedToUnit: String? // TODO revisit
    
    var currentUnitType: UnitType = .mass
    
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
        selectedFromUnit = conversions[defaultUnitType]?.units.first
        selectedToUnit = conversions[defaultUnitType]?.units.first
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
        
        var result: Double?
        
        switch currentUnitType {
           case .mass:
               result = massConverter.convert(value: fromValue, fromUnit: selectedFromUnit ?? "", toUnit: selectedToUnit ?? "")
           case .fuelConsumption:
               result = fuelConsumptionConverter.convert(value: fromValue, fromUnit: selectedFromUnit ?? "", toUnit: selectedToUnit ?? "")
        case .distance:
            print("TO IMPLEMENT")
        case .length:
            print("TO IMPLEMENT")
        }
        
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
                currentUnitType = unitType
                let units = getUnitsOrReturnEmptyArray(unitType)
                fromUnitPickerViewHandler?.items = units
                toUnitPickerViewHandler?.items = units
                fromUnitPicker.reloadAllComponents()
                toUnitPicker.reloadAllComponents()
                
                selectedFromUnit = conversions[unitType]?.units.first
                selectedToUnit = conversions[unitType]?.units.first
            }
        } else if handler === fromUnitPickerViewHandler {
            
            selectedFromUnit = selectedItem
        }
        else if handler === toUnitPickerViewHandler {
            selectedToUnit = selectedItem
        }
    }
}
