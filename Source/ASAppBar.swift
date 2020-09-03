//
//  ASAppBar.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASAppBar: UIView {
    var delegate: ASAppBarDelegate?
    
    final var iscCornerRadius = true
    
    final var type: ASAppBarType = .classic
    
    final var boxHorizontalPadding: CGFloat = 20
    final var boxVerticalPadding: CGFloat = 8
    // MARK: - Const --->
    final let padding0: CGFloat = 0
    final let padding2: CGFloat = 2
    final let padding4: CGFloat = 4
    final let padding8: CGFloat = 8
    final let padding16: CGFloat = 16
    final let padding24: CGFloat = 24
    final let padding32: CGFloat = 32
    final var padding: CGFloat = 8
    // MARK: - Const <---
    
    final var container: UIView?
    final var views: [ASAView]? = [ASAView]()
}
 
