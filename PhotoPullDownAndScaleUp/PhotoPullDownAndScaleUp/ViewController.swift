//
//  ViewController.swift
//  PhotoPullDownAndScaleUp
//
//  Created by 竹田 on 2015/11/19.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        scrollView.contentSize.height = scrollView.frame.size.height + 1
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // scroll down
        if scrollView.contentOffset.y < 0 {
            print(scrollView.contentOffset.y)
            imageTopConstraint.constant = scrollView.contentOffset.y
        }
    }
    
}

