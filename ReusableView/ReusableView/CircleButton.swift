//
//  CircleButton.swift
//  ReusableView
//
//  Created by 竹田 on 2015/11/30.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                layer.backgroundColor = UIColor.whiteColor().CGColor
                setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            } else {
                layer.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.1).CGColor
                setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // make it a circle
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = self.bounds.size.width / 2
    }

}
