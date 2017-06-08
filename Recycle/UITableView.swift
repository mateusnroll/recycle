//
//  UITableView.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 07/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import Foundation

public extension UITableView {
    func registerRecyclableCells<T: UITableViewCell>(_ cells: T.Type...) where T: RecyclableTableViewCell {
        guard !cells.isEmpty
            else { return }

        for cell in cells {
            if let nib = cell.nib {
                self.register(nib, forCellReuseIdentifier: cell.identifier)
            } else {
                self.register(cell.self, forCellReuseIdentifier: cell.identifier)
            }
        }
    }

    func recycle<T: UITableViewCell>(_ cell: T.Type) -> T? where T: RecyclableTableViewCell {
        return self.dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
}
