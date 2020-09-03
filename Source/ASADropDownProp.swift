//
//  ASADropDownProp.swift
//  ASADropDown
//
//  Created by Amit on 15/7/20.
//

import Foundation

public class ASADropDownProp: NSObject {
    public var font: UIFont?
    public var textColor: UIColor?
    public var background: UIColor?
    public var containerBackground: UIColor?
    
    public override init() {
    }
    
    public init(_ font: UIFont?) {
        self.font = font
    }
    
    public init(_ textColor: UIColor?) {
        self.textColor = textColor
    }
    
    public init(_ font: UIFont?, _ textColor: UIColor?) {
        self.font = font
        self.textColor = textColor
    }
    
    public init(_ font: UIFont?, _ textColor: UIColor?, _ background: UIColor?) {
        self.font = font
        self.textColor = textColor
        self.background = background
    }
    
    public init(_ font: UIFont?, _ textColor: UIColor?, _ background: UIColor?, _ containerBackground: UIColor?) {
        self.font = font
        self.textColor = textColor
        self.background = background
        self.containerBackground = containerBackground
    }
}
