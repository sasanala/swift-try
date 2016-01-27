//
//  ViewController.swift
//  FTImageGallery
//
//  Created by 竹田 on 2016/1/27.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageGallery: FTImageGallery!

    let imageFiles = ["cat1", "cat2", "cat3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let images = imageFiles.map { return UIImage(named: $0)! }
        
        imageGallery.autoresizingMask =  [.FlexibleWidth, .FlexibleHeight]
        imageGallery.setImageInputs(images)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

