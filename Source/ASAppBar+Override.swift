//
//  ASAppBar+Override.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension ASAppBar {
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            container?.layer.cornerRadius = getCornerRadius()
        }
    }
}
