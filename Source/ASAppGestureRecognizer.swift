//
//  ASAppGestureRecognizer.swift
//  ASAppBar
//
//  Created by Amit on 3/9/20.
//

import Foundation
import UIKit

public class ASAppGestureRecognizer: UITapGestureRecognizer {
    public var firstObject: Any?
    
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
