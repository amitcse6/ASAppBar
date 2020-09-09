//
//  ASAppBar+Set.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension ASAppBar {
    public func setDelegate(_ delegate: ASAppBarDelegate) -> ASAppBar {
        self.delegate = delegate
        return self
    }
}

// MARK: - Container
extension ASAppBar {
    @discardableResult
    public func setBorderWith(borderColor:UIColor, borderWidth:CGFloat) -> ASAppBar {
        container?.layer.borderColor = borderColor.cgColor
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setBordeColor(_ borderColor: UIColor) -> ASAppBar {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setBordeWidth(_ borderWidth: CGFloat) -> ASAppBar {
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setBackgroundColorAll(_ color: UIColor) -> ASAppBar {
        self.backgroundColor = color
        self.container?.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> ASAppBar {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setTintBackgroundColor(_ color: UIColor) -> ASAppBar {
        self.container?.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: CGFloat) -> ASAppBar {
        iscCornerRadius = false
        container?.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func setCornerRadius50Percent() -> ASAppBar {
        iscCornerRadius = true
        layoutSubviews()
        return self
    }
    
    @discardableResult
    public func setBoxPadding(_ boxPadding: CGSize) -> ASAppBar {
        self.boxPadding = boxPadding
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setMultiplier(_ id: String, _ multiplier: ASAMultiplier?) -> ASAppBar {
        let iconView = views?.filter({ $0.id == id }).first
        iconView?.props?.multiplier = multiplier
        setupConstraints()
        return self
    }

    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    public func getValidId(_ id: String?) -> String {
        if let id = id {
            return id
        }
        return randomString(length: 10)
    }
    
    @discardableResult
    public func setChangableView(_ id: String, _ changableView: ASAChangableView?) -> ASAppBar {
        let iconView = views?.filter({ $0.id == id }).first
        iconView?.removeCurrentView()
        iconView?.changableView = changableView
        iconView?.addCurrentView()
        iconView?.setupConstraints()
        return self
    }
    
    @discardableResult
    public func setSideView(_ id: String? = nil, _ changableView: ASAChangableView?, _ addToBar: Bool, _ defaultType: Bool, _ isExpand: Bool, _ alignType: ASAAlignType?, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, addToBar, defaultType, isExpand, closure, alignType ?? .left)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
}
