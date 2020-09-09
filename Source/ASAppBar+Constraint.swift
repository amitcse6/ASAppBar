//
//  ASAppBar+Constraint.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static var asa_random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}

extension ASAppBar {
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            // MARK: - Container --->
            container?.asa_deactivateAllConstraints()
            container?.topAnchor.constraint(equalTo: topAnchor, constant: boxPadding.height).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -boxPadding.height).isActive = true
            container?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            container?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            // MARK: - Container <---
            
            let barViews = views?.filter({$0.addToBar})
            let centerViews = barViews?.filter({$0.alignType == .center})
            let leftViews = barViews?.filter({$0.alignType == .left})
            let rightViews = barViews?.filter({$0.alignType == .right})
            
            // MARK: - CenterViews --->
            if let views = centerViews {
                for (_, iconView) in views.enumerated() {
                    iconView.asa_deactivateAllConstraints()
                    iconView.setupConstraints()
                    iconView.centerXAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerXAnchor).isActive = true
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    // MARK: - WidthAnchor HeightAnchor --->
                    // MARK: - WidthAnchor HeightAnchor <---
                }
            }
            // MARK: - CenterViews <---
            
            // MARK: - LeftViews --->
            if let views = leftViews {
                for (index, iconView) in views.enumerated() {
                    iconView.asa_deactivateAllConstraints()
                    iconView.setupConstraints()
                    if index == 0 {
                        iconView.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: boxPadding.width).isActive = true
                    }else {
                        iconView.leftAnchor.constraint(equalTo: views[index-1].rightAnchor, constant: padding0).isActive = true
                    }
                    if iconView.isConstraintExpand {
                        if let leftView = leftViews?.last {
                            iconView.rightAnchor.constraint(equalTo: leftView.leftAnchor, constant: -padding0).isActive = true
                        }else{
                            iconView.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -padding0).isActive = true
                        }
                    }
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    // MARK: - WidthAnchor HeightAnchor --->
                    if  iconView.isActive {
                        iconView.heightAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: iconView.props?.multiplier?.v ?? 1).isActive = true
                        if let multiplier = iconView.props?.multiplier, multiplier.hAsWidth, !iconView.isConstraintExpand {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.widthAnchor, multiplier: multiplier.h).isActive = true
                        }else if let multiplier = iconView.props?.multiplier, !iconView.isConstraintExpand {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: multiplier.h).isActive = true
                        }else if !iconView.isConstraintExpand {
                            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
                        }
                    }else{
                        iconView.widthAnchor.constraint(equalToConstant: 0).isActive = true
                        iconView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                    // MARK: - WidthAnchor HeightAnchor <---
                }
            }
            // MARK: - LeftViews <---
            
            // MARK: - RightViews --->
            if let views = rightViews {
                for (index, iconView) in views.enumerated() {
                    iconView.asa_deactivateAllConstraints()
                    iconView.setupConstraints()
                    if index == 0 {
                        iconView.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -boxPadding.width).isActive = true
                    }else {
                        iconView.rightAnchor.constraint(equalTo: views[index-1].leftAnchor, constant: -padding0).isActive = true
                    }
                    if iconView.isConstraintExpand {
                        if let leftView = leftViews?.last {
                            iconView.leftAnchor.constraint(equalTo: leftView.rightAnchor, constant: padding0).isActive = true
                        }else{
                            iconView.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: padding0).isActive = true
                        }
                    }
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    // MARK: - WidthAnchor HeightAnchor --->
                    if  iconView.isActive {
                        iconView.heightAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: iconView.props?.multiplier?.v ?? 1).isActive = true
                        if let multiplier = iconView.props?.multiplier, multiplier.hAsWidth, !iconView.isConstraintExpand {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.widthAnchor, multiplier: multiplier.h).isActive = true
                        }else if let multiplier = iconView.props?.multiplier, !iconView.isConstraintExpand {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: multiplier.h).isActive = true
                        }else if !iconView.isConstraintExpand {
                            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
                        }
                    }else{
                        iconView.widthAnchor.constraint(equalToConstant: 0).isActive = true
                        iconView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                    // MARK: - WidthAnchor HeightAnchor <---
                }
            }
            // MARK: - RightViews <---
        } else {
            // Fallback on earlier versions
        }
    }
}
