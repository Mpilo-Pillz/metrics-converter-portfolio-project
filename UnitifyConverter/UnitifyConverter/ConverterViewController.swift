//
//  ConverterViewController.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/02.
//

import UIKit

class ConverterViewController: UIViewController  {
    
    let measurementTypes = ["Mass", "Length", "Consumption"]
    var units = [Unit(name: "Kilograms", conversionFactor: 10.0), Unit(name: "Pounds lb", conversionFactor: 100.0)]
    var selectedFromUnit: Unit?
    var selectedToUnit: Unit?
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var measurementTypesPicker: UIPickerView!
    @IBOutlet weak var fromUnitPicker: UIPickerView!
    @IBOutlet weak var toUnitPicker: UIPickerView!
    
    var measurementTypePickerviewHandler: PickerViewHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePickerViews()
        
        selectedFromUnit = units.first
        selectedToUnit = units.first
    }
    
    private func configurePickerViews() {
        measurementTypePickerviewHandler = PickerViewHandler(items: measurementTypes, delegate: self)
        
        measurementTypesPicker.dataSource = measurementTypePickerviewHandler
        measurementTypesPicker.delegate = measurementTypePickerviewHandler
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let fromValue = Double(fromTextField.text ?? ""),
              let fromUnit = selectedFromUnit,
              let toUnit = selectedToUnit else {
            return
        }
        
        let converter = Converter(fromUnit: fromUnit, toUnit: toUnit)
        //        let result = converter.convert(value: fromValue)
        
        //        outputTextField.text = "\(result)"
        
    }
}

extension ConverterViewController: PickerViewHandlerDelegate {
    func didSelectItem(_ handler: PickerViewHandler, selectedItem: String) {
        print("SelectedITem \(selectedItem)")
    }
}
