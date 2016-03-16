//
//  FTFoodUnitTextField.swift
//  TryDoneDatePicker
//
//  Created by 竹田 on 2016/3/16.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class FTFoodUnitTextField: FTPickerTextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        text = "3.4 杯"
        setPickerByText()
    }
    
    override func initUnits() -> [String] {
        return ["份", "杯", "碗", "匙"]
    }
    
}
