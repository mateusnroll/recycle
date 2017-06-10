//
//  Recyclable.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import Foundation

/**
 Mixin to make the cell/view recyclable to UICollecitonView 
 and UITableView. Having a nib is optional.
 
 It will look for a nib file with the same names as the class. 
 If it can not be found, the cell will be registered without it.
 */
public protocol Recyclable: class {
    static var identifier: String { get }
    static var nib: UINib? { get }
    static var nibName: String? { get }
    static var kind: String? { get }
    static var bundle: Bundle? { get }
}

public extension Recyclable {
    static var identifier: String {
        return String(describing: Self.self)
    }

    static var nibName: String? {
        return nil
    }

    static var bundle: Bundle? {
        return nil
    }

    static var kind: String? {
        return nil
    }

    static var nib: UINib? {
        if let nibName = self.nibName {
            return UINib(nibName: nibName, bundle: self.bundle)
        } else {
            return UINib(nibName: identifier, bundle: self.bundle)
        }
    }
}
