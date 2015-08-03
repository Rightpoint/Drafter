//
//  PrivateAutolayoutHelpers.swift
//  Pods
//
//  Created by Derek Ostrander on 8/1/15.
//
//

import UIKit

// Generic internal functions

extension Array {
    func find(f: (Element) -> (Bool)) -> Element? {
        guard let index = self.indexOf(f) else {
            return nil
        }
        return self[index]
    }
}
