//
//  RecyclableCollectionViewCell.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import UIKit

public protocol RecyclableCollectionViewCell: class {
    static var identifier: String { get }
    static var nib: UINib? { get }
    static var nibName: String? { get }
    static var bundle: Bundle? { get }
}

public extension RecyclableCollectionViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }

    static var nibName: String? {
        return nil
    }

    static var bundle: Bundle? {
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
