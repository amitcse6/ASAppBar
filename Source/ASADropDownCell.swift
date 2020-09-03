//
//  ASADropDownCell.swift
//  superapp
//
//  Created by Amit on 11/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

protocol ASADropDownCellDelegate {
    func selected(_ cell: ASADropDownCell)
}

class ASADropDownCell: UIView {
    var delegate: ASADropDownCellDelegate?
    
    internal var container: UIView?
    internal var myView: UIView?
    internal var myLabel: UILabel?
    internal var index = 0
    internal var padding: CGFloat = 8
    internal var item: ASADropDownItem?
    internal var prop: ASADropDownProp?
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ index: Int, _ item: ASADropDownItem, _ prop: ASADropDownProp?) {
        super.init(frame: CGRect.zero)
        self.index = index
        self.item = item
        self.prop = prop
        setup()
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        backgroundColor = prop?.background
        
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        container?.backgroundColor = prop?.containerBackground
        
        myView = item?.changableView?.normal?()
        self.container?.addSubview(self.myView.unsafelyUnwrapped)
        
        self.myLabel = UILabel()
        self.container?.addSubview(self.myLabel.unsafelyUnwrapped)
        self.myLabel?.text = item?.title ?? ""
        self.myLabel?.backgroundColor = .clear
        if let prop = prop, let font = prop.font {
            self.myLabel?.font = font
        }else {
            self.myLabel?.font = UIFont.systemFont(ofSize: 15)
        }
        if let prop = prop, let textColor = prop.textColor {
            self.myLabel?.textColor = textColor
        }else {
            self.myLabel?.textColor = UIColor(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1.0)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        gesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(gesture)
        self.isUserInteractionEnabled = true
    }
    
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            container?.translatesAutoresizingMaskIntoConstraints = false
            container?.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
            
            self.myView?.translatesAutoresizingMaskIntoConstraints = false
            self.myView?.topAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.topAnchor).isActive = true
            self.myView?.leftAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.leftAnchor).isActive = true
            //self.myView?.rightAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.rightAnchor).isActive = true
            self.myView?.bottomAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.bottomAnchor).isActive = true
            self.myView?.widthAnchor.constraint(equalTo: self.myView.unsafelyUnwrapped.heightAnchor).isActive = true
            
            self.myLabel?.translatesAutoresizingMaskIntoConstraints = false
            self.myLabel?.topAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.topAnchor).isActive = true
            self.myLabel?.leftAnchor.constraint(equalTo: self.myView.unsafelyUnwrapped.rightAnchor, constant: padding).isActive = true
            self.myLabel?.rightAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.rightAnchor).isActive = true
            self.myLabel?.bottomAnchor.constraint(equalTo: self.container.unsafelyUnwrapped.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func onTap(sender : AnyObject){
        delegate?.selected(self)
    }
    
    public func getIndex() -> Int {
        return index
    }
}
