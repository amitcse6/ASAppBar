//
//  ASAppBar+UIView.swift
//  ASAppBar
//
//  Created by Amit on 3/9/20.
//

import Foundation
import UIKit

// MARK: - Swift 4
extension UIView {
    func asa_deactivateImmediateConstraints(){
        NSLayoutConstraint.deactivate(self.asa_immediateConstraints)
    }
    func asa_deactivateAllConstraints() {
        NSLayoutConstraint.deactivate(self.asa_allConstraints)
        translatesAutoresizingMaskIntoConstraints = false
    }
    var asa_immediateConstraints:[NSLayoutConstraint]{
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            } ?? []
        return self.constraints + constraints
    }
    var asa_allConstraints:[NSLayoutConstraint] {
        var view: UIView? = self
        var constraints:[NSLayoutConstraint] = []
        while let currentView = view {
            constraints += currentView.constraints.filter {
                return $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            }
            view = view?.superview
        }
        return constraints
    }
}
