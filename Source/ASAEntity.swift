//
//  ASAEntity.swift
//  superapp
//
//  Created by Amit on 3/9/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASAEntity: NSObject, NSCopying {
    public var object: Any?

    public init(object: Any?) {
        self.object = object
    }

    init(_ myClass: ASAEntity) {
        self.object = myClass.object
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ASAEntity(object: object)
        return copy
    }

    public func classCopy() -> ASAEntity {
        return ASAEntity(self)
    }
}
