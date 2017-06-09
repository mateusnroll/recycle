//
//  RecyclableTableViewCell.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 07/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import UIKit

public protocol RecyclableTableViewCell: class {
    static var identifier: String { get }
    static var nib: UINib? { get }
    static var nibName: String? { get }
    static var bundle: String? { get }
}

public extension RecyclableTableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }

    static var nibName: String? {
        return nil
    }

    static var bundle: String? {
        return nil
    }

    static var nib: UINib? {
        if let nibName = self.nibName {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return UINib(nibName: identifier, bundle: nil)
        }
    }
}
