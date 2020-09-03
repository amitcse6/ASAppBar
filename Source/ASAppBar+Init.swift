//
//  ASAppBar+Init.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension ASAppBar {
    public func initUIElements() {
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        
        views?.forEach({ (view) in
            view.contentMode = .scaleAspectFit
            container?.addSubview(view)
        }) 
    }
}

