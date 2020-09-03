//
//  ASAppBar+Get.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension ASAppBar {
    func getCornerRadius() -> CGFloat {
        return (container?.bounds.size.height ?? 0 - padding*2) * 0.5
    }
}
