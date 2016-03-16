//
//  FTPickerTextField.swift
//  TryDoneDatePicker
//
//  Created by 竹田 on 2016/3/16.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class FTPickerTextField: FTDoneTextField, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let DECIMAL_POINT = "."
    let UNIT_PREFIX   = " "
    
    enum TextSection: Int {
        case Integers
        case Decimals
        case Units
    }
    
    var integers: [String] = []
    var decimals: [String] = []
    var units: [String] = []
    
    let picker = UIPickerView()
    var pickerValue: [Int] = []
    var pickerDataSource: [[String]] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupDataSource()
        
        tintColor = UIColor.clearColor()
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = UIColor.whiteColor()
        inputView = picker
        
        setDefaultValue()
    }
    
    func setupDataSource() {
        integers = initIntegers()
        decimals = initDecimals()
        units = initUnits()
        
        pickerDataSource = [
            integers,
            decimals.map{ return DECIMAL_POINT + $0 },
            units.map{ return UNIT_PREFIX + $0 }
        ]
    }
    
    internal func initIntegers() -> [String] {
        return (0...99).map { return String($0) }
    }
    
    internal func initDecimals() -> [String] {
        return (0...9).map { return String($0) }
    }
    
    internal func initUnits() -> [String] {
        return ["單位1", "單位2", "單位3", "單位4", "單位5"]
    }
    
    func setDefaultValue() {
        // set default pickerValue
        pickerValue = [Int](count: pickerDataSource.count, repeatedValue: 0)
        pickerValue[0] = 1
        
        setPickerByText()
    }
    
    func setPickerByText() {
        explodeTextToPickerValue()
        
        // set picker by pickerValue
        for (componentIndex, value) in pickerValue.enumerate() {
            picker.selectRow(value, inComponent: componentIndex, animated: false)
        }
    }
    
    func explodeTextToPickerValue() {
        guard let text = text else {
            return
        }
        
        let tokens = text.componentsSeparatedByString(UNIT_PREFIX)
        if tokens.count < 2 {
            return
        }
        
        let numbers = tokens[0].componentsSeparatedByString(DECIMAL_POINT)
        let unit    = tokens[1]
        let integer = numbers[0]
        let decimal = numbers.count > 1 ? numbers[1] : "0"
        
        if let integerIndex = integers.indexOf(integer) {
            pickerValue[TextSection.Integers.rawValue] = integerIndex
        }
        if let decimalIndex = decimals.indexOf(decimal) {
            pickerValue[TextSection.Decimals.rawValue] = decimalIndex
        }
        if let unitIndex = units.indexOf(unit) {
            pickerValue[TextSection.Units.rawValue] = unitIndex
        }
    }
    
    // MARK: - UIPickerViewDataSource, UIPickerViewDelegate
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource[component].count
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width/CGFloat(pickerDataSource.count + 2)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue[component] = row
        
        var valueString = ""
        for (index, value) in pickerValue.enumerate() {
            valueString += pickerDataSource[index][value]
        }
        
        self.text = valueString
    }
    
}
