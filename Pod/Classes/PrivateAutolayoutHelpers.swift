//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

// Generic internal functions

internal func get <A> (xs: [A], f:((A) -> (Bool))) -> A? {
    guard let index = xs.indexOf(f) else {
        return nil
    }
    return xs[index]
}
