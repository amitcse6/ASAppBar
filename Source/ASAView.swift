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
    public var isOn = false
    public var isExpand = false
    public var isConstraintExpand = false
    public var addToBar = false
    
    public var alignType = ASAAlignType.left
    
    public var container: UIView?
    
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
    
    init(_ id: String, _ appBar: ASAppBar?, _ changableView: ASAChangableView?, _ addToBar: Bool, _ closure: ASAViewClosure?, _ alignType: ASAAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.appBar = appBar
        self.changableView = changableView
        self.isActive = true
        self.iconClosure = closure
        self.alignType = alignType
        self.addToBar = addToBar
        self.id = id
        setup()
    }
    
    init(_ id: String, _ appBar: ASAppBar?, _ changableView: ASAChangableView?, _ addToBar: Bool, _ defaultType: Bool, _ isExpand: Bool, _ closure: ASAViewClosure?, _ alignType: ASAAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.appBar = appBar
        self.changableView = changableView
        self.isActive = true
        self.isOn = defaultType
        self.iconClosure = closure
        self.alignType = alignType
        self.isExpand = isExpand
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
    
    func addCurrentView() {
        removeCurrentView()
        currentView = (isOn ? changableView?.selected?() : changableView?.normal?())
        isConstraintExpand = (isExpand && isOn) ? true : false
        container?.addSubview(currentView.unsafelyUnwrapped)
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
            currentView?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: (props?.multiplier?.v ?? 0 > 0 ? props?.iconPadding?.height ?? 0 : 0)).isActive = true
            currentView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: (props?.multiplier?.h ?? 0 > 0 ? props?.iconPadding?.width ?? 0 : 0)).isActive = true
            currentView?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: (props?.multiplier?.h ?? 0 > 0 ? -(props?.iconPadding?.width ?? 0) : -0)).isActive = true
            currentView?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: (props?.multiplier?.v ?? 0 > 0 ? -(props?.iconPadding?.height ?? 0) : -0)).isActive = true
            currentView?.centerXAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerXAnchor).isActive = true
            currentView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
            // MARK: - ImageView <---
        } else {
            // Fallback on earlier versions
        }
    }
    
    func removeCurrentView() {
        if currentView != nil {
            currentView?.removeFromSuperview()
            currentView = nil
        }
    }
}

extension ASAView {
    public var props: ASAProps? {
        return (isOn ? changableView?.selectedProps : changableView?.normalProps)
    }
    
    @objc public func iconEvent(_ sender: ASAppBarGestureRecognizer? = nil) {
        isOn.toggle()
        print("isOn: \(isOn)")
        addCurrentView()
        setupConstraints()
        appBar?.setupConstraints()
        iconClosure?(appBar.unsafelyUnwrapped, self, isOn)
    }
}
