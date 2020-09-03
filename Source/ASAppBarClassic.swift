//
//  ASAppBarClassic.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public protocol ASAppBarDelegate {
}

public class ASAppBarClassic: ASAppBar {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ delegate: ASAppBarDelegate) {
        super.init(frame: CGRect.zero)
        self.delegate = delegate
        setup()
    }
    
    public func setup() {
        type = .classic
        initUIElements()
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        // MARK: - Container --->
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        setCornerRadius50Percent()
        setBordeColor(.clear)
        setBordeWidth(0)
        setCornerRadius(0)
        // MARK: - Container <---
        
        
        // MARK: - Views --->
        views?.forEach({ (view) in
            view.backgroundColor = .clear
        })
        // MARK: - Views <---
    }
}

