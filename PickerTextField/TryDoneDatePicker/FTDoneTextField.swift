//
//  FTDoneTextField.swift
//  TryDoneDatePicker
//
//  Created by 竹田 on 2016/3/16.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class FTDoneTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let keyboardDoneButtonView = UIToolbar()
        keyboardDoneButtonView.sizeToFit()
        let doneButton = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneClicked:"))
        doneButton.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.redColor()], forState: .Normal)
        
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        keyboardDoneButtonView.setItems([spaceItem, doneButton], animated: false)
        self.inputAccessoryView = keyboardDoneButtonView
    }
    
    func doneClicked(sender: AnyObject) {
        self.resignFirstResponder()
    }
}
