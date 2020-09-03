//
//  ASAKeyboardGesture.swift
//  superapp
//
//  Created by Amit on 2/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASAKeyboardGesture: UITapGestureRecognizer {
    var firstObject: Any?
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
