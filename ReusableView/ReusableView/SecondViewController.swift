//
//  SecondViewController.swift
//  ReusableView
//
//  Created by 竹田 on 2015/11/30.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, MyKeyboardViewDelegate {

    @IBOutlet weak var keyboardView: MyKeyboardView!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        keyboardView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        textView.text = ""
    }

    // MARK: MyNumberKeyboardViewDelegate
    
    func myKeyboardViewDelegate(myNumberKeyboardView: MyKeyboardView, tappedText: String) {
        textView.text = textView.text + tappedText
    }

}
