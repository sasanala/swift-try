//
//  Extension.swift
//  TryDoneDatePicker
//
//  Created by 竹田 on 2016/3/16.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import Foundation


extension String {

    func matchesForRegexInText(regex: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = self as NSString
            let results = regex.matchesInString(self,
                options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substringWithRange($0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

}