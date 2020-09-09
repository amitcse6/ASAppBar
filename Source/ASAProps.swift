//
//  ASAProps.swift
//  ASAppBar
//
//  Created by Amit on 9/9/20.
//

import Foundation
import UIKit

public class ASAProps {
    public var multiplier: ASAMultiplier?
    public var iconPadding: CGSize?
    
    public init(_ multiplier: ASAMultiplier?, _ iconPadding: CGSize?) {
        self.multiplier = multiplier
        self.iconPadding = iconPadding
    }
}
