//
//  MyNumberKeyboardView.swift
//  ReusableView
//
//  Created by 竹田 on 2015/11/30.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

class MyNumberKeyboardView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        if let nibsView = NSBundle.mainBundle().loadNibNamed("MyNumberKeyboardView", owner: self, options: nil) as? [UIView] {
            let nibRoot = nibsView[0]
            self.addSubview(nibRoot)
            nibRoot.frame = self.bounds
        }
    }

}
