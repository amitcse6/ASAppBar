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
    public func setMultiplier(_ id: Int, _ multiplier: ASAMultiplier?) -> ASAppBar {
        let iconView = views?.filter({ $0.id == id }).first
        iconView?.multiplier = multiplier
        setupConstraints()
        return self
    }
    
    public func getValidId(_ id: Int?) -> Int {
        if let id = id {
            return id
        }
        return views?.count ?? 0
    }
}

// MARK: - LEFT VIEW
extension ASAppBar {
    @discardableResult
    public func setLeftView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, iconPadding, addToBar, closure, .left)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setLeftView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier? = nil, _ defaultType: Bool, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, defaultType, iconPadding, addToBar, closure, .left)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setLeftView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ isExpand: Bool, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, iconPadding, isExpand, addToBar, closure, .left)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
}

// MARK: - RIGHT VIEW
extension ASAppBar {
    @discardableResult
    public func setRightView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, iconPadding, addToBar, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setRightView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ isExpand: Bool, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, iconPadding, isExpand, addToBar, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setRightView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ defaultType: Bool, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, defaultType, iconPadding, addToBar, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setRightView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ defaultType: Bool, _ isAutoEvent: Bool, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, defaultType, isAutoEvent, iconPadding, addToBar, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setCenterView(_ id: Int? = nil, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ isExpand: Bool, _ addToBar: Bool, _ closure: ASAViewClosure?) -> ASAppBar {
        let iconView = ASAView(getValidId(id), self, changableView, multiplier, iconPadding, isExpand, addToBar, closure, .center)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
}
