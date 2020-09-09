//
//  ASAChangableView.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASAChangableView {
    public var title: String?
    public var normal: ASAChangableViewClosure?
    public var selected: ASAChangableViewClosure?
    public var normalProps: ASAProps?
    public var selectedProps: ASAProps?
    
    public init(_ title: String?, _ normal: ASAChangableViewClosure?, _ selected: ASAChangableViewClosure?, _ normalProps: ASAProps? = nil, _ selectedProps: ASAProps? = nil) {
        self.title = title
        self.normal = normal
        self.selected = selected
        self.normalProps = normalProps
        self.selectedProps = selectedProps
    }
}
