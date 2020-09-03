//
//  ASADropDownItem.swift
//  superapp
//
//  Created by Amit on 8/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASADropDownItem {
    var key: String?
    var title: String?
    var changableView: ASAChangableView?
    
    public init(key: String?, title: String?, _ changableView: ASAChangableView?) {
        self.key = key
        self.title = title
        self.changableView = changableView
    }
}
