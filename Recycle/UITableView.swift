//
//  UITableView.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 07/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import Foundation

public extension UITableView {
    func registerRecyclableCells(_ cells: AnyObject...) {
        for cell in cells {
            if let cell = cell.self as? RecyclableTableViewCell.Type {
                registerRecyclableCell(cell)
            } else {
                print("RecyclableTableViewCell: Can not register cell, does not conform to protocol.", cell)
            }
        }
    }

    private func registerRecyclableCell(_ cell: RecyclableTableViewCell.Type) {
        if let nib = cell.nib {
            self.register(nib, forCellReuseIdentifier: cell.identifier)
        } else {
            self.register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }

    func recycle<T: RecyclableTableViewCell>(_ cell: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
}
