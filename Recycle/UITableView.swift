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
    /**
     Registers recyclable UITableViewCell(s) to the UITableView. 
     All cells need to conform to the Recyclable protocol.

     - parameter cells: One or more Recyclable-compliant cells
     */
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

    /**
     Retrieves a registered recyclable cell from the UITableView

     - parameter cell: Cell to be retrieved
     */
    func recycle<T: Recyclable>(_ cell: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
}

// MARK: - UITableViewHeaderFooterView

public extension UITableView {
    /**
     Registers recyclable UITableViewHeaderFooterView(s) to the UITableView.
     All views need to conform to the Recyclable protocol.

     - parameter views: One or more Recyclable-compliant views
     */
    func registerRecyclableHeaderFooterViews(_ views: AnyObject...) {
        for view in views {
            if let view = view.self as? Recyclable.Type {
                registerRecyclableHeaderFooterView(view)
            } else {
                print("[ERROR] Recyclable: Can not register cell, does not conform to protocol.", view)
            }
        }
    }

    private func registerRecyclableHeaderFooterView(_ view: Recyclable.Type) {
        if let nib = view.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: view.identifier)
        } else {
            self.register(view.self, forCellReuseIdentifier: view.identifier)
        }
    }

    /**
     Retrieves a registered recyclable header/footer view from the UITableView

     - parameter view: View to be retrieved
     */
    func recycleHeaderFooter<T: Recyclable>(_ view: T.Type) -> T? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: view.identifier) as? T
    }
}
