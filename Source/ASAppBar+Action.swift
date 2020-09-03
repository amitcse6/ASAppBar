//
//  ASAppBar+Action.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension ASAppBar {
    public func showMore(_ view: UIView, _ backgroundColor: UIColor?, _ props: ASADropDownProp, _ selectionAction: @escaping ASADropDownSelectionClosure) {
        if let moreViews = views?.filter({!$0.addToBar}) {
            let items = moreViews.map({return ASADropDownItem(key: "key_\($0)", title: $0.changableView?.title, $0.changableView)})
            if #available(iOS 9.0, *) {
                ASADropDown.openDropDown(items, backgroundColor, props, { (index, title) in
                    selectionAction(index, title)
                }, view, nil)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

