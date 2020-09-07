//
//  ASAView.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASAView : UIView {
    public var appBar: ASAppBar?
    
    public var id: String = ""
    
    public var isActive = false
    public var isAutoEvent = false
    public var isOn = false
    public var isExpand = false
    public var isConstraintExpand = false
    public var addToBar = false
    
    public var multiplier: ASAMultiplier?
    
    public var alignType = ASAAlignType.left
    
    public var container: UIView?
    
    public var iconPadding: CGSize = CGSize.zero
    
    public var changableView: ASAChangableView?
    
    public var currentView: UIView?
    
    public var iconClosure: ASAViewClosure?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(_ id: String, _ appBar: ASAppBar?, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?, _ alignType: ASAAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.appBar = appBar
        self.changableView = changableView
        self.isActive = true
        self.multiplier = multiplier
        self.iconClosure = closure
        self.alignType = alignType
        self.iconPadding = iconPadding
        self.addToBar = addToBar
        self.id = id
        setup()
    }
    
    init(_ id: String, _ appBar: ASAppBar?, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ iconPadding: CGSize, _ isExpand: Bool, _ addToBar: Bool, _ closure: ASAViewClosure?, _ alignType: ASAAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.appBar = appBar
        self.changableView = changableView
        self.isActive = true
        self.multiplier = multiplier
        self.iconClosure = closure
        self.alignType = alignType
        self.iconPadding = iconPadding
        self.isExpand = isExpand
        self.addToBar = addToBar
        self.id = id
        setup()
    }
    
    init(_ id: String, _ appBar: ASAppBar?, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ defaultType: Bool, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?, _ alignType: ASAAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.appBar = appBar
        self.iconClosure = closure
        self.isActive = true
        self.multiplier = multiplier
        self.isOn = defaultType
        self.changableView = changableView
        self.alignType = alignType
        self.iconPadding = iconPadding
        self.addToBar = addToBar
        self.id = id
        setup()
    }
    
    init(_ id: String, _ appBar: ASAppBar?, _ changableView: ASAChangableView?, _ multiplier: ASAMultiplier?, _ defaultType: Bool, _ isAutoEvent: Bool, _ iconPadding: CGSize, _ addToBar: Bool, _ closure: ASAViewClosure?, _ alignType: ASAAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.appBar = appBar
        self.iconClosure = closure
        self.isActive = true
        self.isAutoEvent = isAutoEvent
        self.multiplier = multiplier
        self.isOn = defaultType
        self.changableView = changableView
        self.alignType = alignType
        self.iconPadding = iconPadding
        self.addToBar = addToBar
        self.id = id
        setup()
    }
    
    public func getID() -> String {
        return id
    }
    
    public func setup() {
        initUIElements()
        setupUIElements()
        setupConstraints()
    }
    
    public func initUIElements() {
        // MARK: - Container --->
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        // MARK: - Container <---
        
        // MARK: - Normal --->
        addCurrentView()
        // MARK: - Normal <---
    }
    
    public func setupUIElements() {
        // MARK: - Self --->
        backgroundColor = .clear
        addGestureRecognizer(ASAppGestureRecognizer(target: self, action: #selector(iconEvent(_:))))
        // MARK: - Self <---
        
        // MARK: - Container --->
        container?.backgroundColor = .clear
        // MARK: - Container <---
        
        // MARK: - CurrentView --->
        currentView?.backgroundColor = .clear
        // MARK: - CurrentView <---
    }
    
    func setupConstraints() {
        if #available(iOS 9.0, *) {
            // MARK: - Container --->
            container?.asa_deactivateAllConstraints()
            container?.topAnchor.constraint(equalTo: topAnchor).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            // MARK: - Container <---
            
            // MARK: - ImageView --->
            currentView?.asa_deactivateAllConstraints()
            currentView?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: (multiplier?.v ?? 0 > 0 ? iconPadding.height : 0)).isActive = true
            currentView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: (multiplier?.h ?? 0 > 0 ? iconPadding.width : 0)).isActive = true
            currentView?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: (multiplier?.h ?? 0 > 0 ? -iconPadding.width : -0)).isActive = true
            currentView?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: (multiplier?.v ?? 0 > 0 ? -iconPadding.height : -0)).isActive = true
            currentView?.centerXAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerXAnchor).isActive = true
            currentView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
            // MARK: - ImageView <---
        } else {
            // Fallback on earlier versions
        }
    }
    
    func addCurrentView() {
        removeCurrentView()
        currentView = (isOn ? changableView?.selected?() : changableView?.normal?())
        isConstraintExpand = (isExpand && isOn) ? true : false
        container?.addSubview(currentView.unsafelyUnwrapped)
    }
    
    func removeCurrentView() {
        if currentView != nil {
            currentView?.removeFromSuperview()
            currentView = nil
        }
    }
}

extension ASAView {
    @objc public func iconEvent(_ sender: ASAppBarGestureRecognizer? = nil) {
        isOn.toggle()
        addCurrentView()
        setupConstraints()
        appBar?.setupConstraints()
        iconClosure?(appBar.unsafelyUnwrapped, self, isOn)
    }
}
