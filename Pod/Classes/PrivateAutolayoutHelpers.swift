//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

// Generic internal functions

internal func constraint <NSLayoutConstraint> (xs: [NSLayoutConstraint], f:((NSLayoutConstraint) -> (Bool))) -> NSLayoutConstraint? {
    guard let index = xs.indexOf(f) else {
        return nil
    }
    return xs[index]
}
