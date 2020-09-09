//
//  ASAMultiplier.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASAMultiplier {
    public var h: CGFloat = 1
    public var v: CGFloat = 1
    public var hAsWidth: Bool = false
    
    public init(_ h: CGFloat, _ v: CGFloat) {
        self.h = h
        self.v = v
    }
    
    public init(_ h: CGFloat, _ v: CGFloat, _ hAsWidth: Bool = false) {
        self.h = h
        self.v = v
        self.hAsWidth = hAsWidth
    }
}

extension ASAMultiplier {
    public static var zero: ASAMultiplier {
        return ASAMultiplier(0, 0, false)
    }
}
