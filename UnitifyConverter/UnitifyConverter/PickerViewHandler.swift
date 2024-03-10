//
//  PickerViewHandler.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/03/03.
//

import UIKit

protocol PickerViewHandlerDelegate: AnyObject {
    func didSelectItem(_ handler: PickerViewHandler, selectedItem: String)
}

class PickerViewHandler: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
     var items: [String]
    weak var delegate: PickerViewHandlerDelegate?
    
    init(items: [String], delegate: PickerViewHandlerDelegate? = nil) {
        self.items = items
        self.delegate = delegate
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedItem = items[row]
        delegate?.didSelectItem(self, selectedItem: selectedItem)  
    }
}
