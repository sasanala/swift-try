//
//  ViewController.swift
//  ReusableView
//
//  Created by 竹田 on 2015/11/30.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyKeyboardViewDelegate {

    @IBOutlet weak var keyboardView: MyKeyboardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions

    @IBAction func unwindFromSecondView(sender: UIStoryboardSegue) {
        
    }
    
    // MARK: MyNumberKeyboardViewDelegate
    func myKeyboardViewDelegate(myNumberKeyboardView: MyKeyboardView, tappedText: String) {
        print("tappedText = \(tappedText)")
    }

}

