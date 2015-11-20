//
//  ViewController.swift
//  TableViewAndNavigation
//
//  Created by 竹田 on 2015/11/20.
//  Copyright © 2015年 ChuroCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let data = ["Apple", "Bee", "Cat", "Dog", "Egg", "Fox", "Google", "Hadoop" ]
    let tableRowHeight: CGFloat = 120
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // use line in the cell instead of separator
        tableView.separatorStyle = .None
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyTableViewCell
        
        let row = indexPath.row
        cell.titleLabel.text = data[row]
        
        // change selected background color
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = cell.lineView.backgroundColor
        cell.selectedBackgroundView = selectedBackgroundView
        
        // hide the last separator
        if row == data.count - 1 {
            cell.lineView.backgroundColor = UIColor.clearColor()
        }
        
        return cell
    }

    // decide the table row height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.frame.size.height / CGFloat(data.count)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

