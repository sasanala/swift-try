//
//  MyNumberKeyboardView.swift
//  ReusableView
//
//  Created by 竹田 on 2015/11/30.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

protocol MyKeyboardViewDelegate: class {
    func myKeyboardViewDelegate(myKeyboardView: MyKeyboardView, tappedText: String)
}

class MyKeyboardView: UIView {
    
    var delegate: MyKeyboardViewDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        if let nibsView = NSBundle.mainBundle().loadNibNamed("MyKeyboardView", owner: self, options: nil) as? [UIView] {
            let nibRoot = nibsView[0]
            self.addSubview(nibRoot)
            nibRoot.frame = self.bounds
        }
    }

    @IBAction func buttonTapped(sender: CircleButton) {
        let text = sender.titleLabel?.text ?? ""
        delegate?.myKeyboardViewDelegate(self, tappedText: text)
    }

}
