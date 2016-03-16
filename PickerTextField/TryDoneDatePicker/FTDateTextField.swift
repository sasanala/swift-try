//
//  FTDateTextField.swift
//  TryDoneDatePicker
//
//  Created by 竹田 on 2016/3/16.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class FTDateTextField: FTDoneTextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .Date
        datePicker.backgroundColor = UIColor.whiteColor()

        inputView = datePicker
    }
    
}
