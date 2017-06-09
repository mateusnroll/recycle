//
//  UICollectionView.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import Foundation

public extension UICollectionView {
    func registerRecyclableCells(_ cells: AnyObject...) {
        for cell in cells {
            if let cell = cell.self as? RecyclableCollectionViewCell.Type {
                registerRecyclableCell(cell)
            } else {
                print("RecyclableCollectionViewCell: Can not register cell, does not conform to protocol.", cell)
            }
        }
    }

    private func registerRecyclableCell(_ cell: RecyclableCollectionViewCell.Type) {
        if let nib = cell.nib {
            self.register(nib, forCellWithReuseIdentifier: cell.identifier)
        } else {
            self.register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }

    func recycle<T: RecyclableCollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as? T
    }
}
