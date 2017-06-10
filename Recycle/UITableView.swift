//
//  UITableView.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 07/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import Foundation

// MARK: - UITableViewCell

public extension UITableView {
    func registerRecyclableCells(_ cells: AnyObject...) {
        for cell in cells {
            if let cell = cell.self as? Recyclable.Type {
                registerRecyclableCell(cell)
            } else {
                print("[ERROR] Recyclable: Can not register cell, does not conform to protocol.", cell)
            }
        }
    }

    private func registerRecyclableCell(_ cell: Recyclable.Type) {
        if let nib = cell.nib {
            self.register(nib, forCellReuseIdentifier: cell.identifier)
        } else {
            self.register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }

    func recycle<T: Recyclable>(_ cell: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
}

// MARK: - UITableViewHeaderFooterView

public extension UITableView {
    func registerRecyclableHeaderFooterViews(_ cells: AnyObject...) {
        for cell in cells {
            if let cell = cell.self as? Recyclable.Type {
                registerRecyclableHeaderFooterView(cell)
            } else {
                print("[ERROR] Recyclable: Can not register cell, does not conform to protocol.", cell)
            }
        }
    }

    private func registerRecyclableHeaderFooterView(_ cell: Recyclable.Type) {
        if let nib = cell.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: cell.identifier)
        } else {
            self.register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }

    func recycleHeaderFooter<T: Recyclable>(_ cell: T.Type) -> T? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: cell.identifier) as? T
    }
}
