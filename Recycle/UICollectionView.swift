//
//  UICollectionView.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import Foundation

// MARK: - UICollectionViewCell

public extension UICollectionView {
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
            self.register(nib, forCellWithReuseIdentifier: cell.identifier)
        } else {
            self.register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }

    func recycle<T: Recyclable>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as? T
    }
}

// MARK: - UICollectionReusableView

public extension UICollectionView {
    func registerReusableViews(_ views: AnyObject...) {
        for view in views {
            if let view = view.self as? Recyclable.Type {
                registerReusableView(view)
            } else {
                print("[ERROR] Recyclable: Can not register view, does not conform to protocol.", view)
            }
        }
    }

    private func registerReusableView(_ view: Recyclable.Type) {
        if let nib = view.nib {
            self.register(nib, forSupplementaryViewOfKind: view.kind ?? "", withReuseIdentifier: view.identifier)
        } else {
            self.register(view.self, forSupplementaryViewOfKind: view.kind ?? "", withReuseIdentifier: view.identifier)
        }
    }

    func recycleReusableView<T: Recyclable>(_ view: Recyclable.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableSupplementaryView(ofKind: view.kind ?? "", withReuseIdentifier: view.identifier, for: indexPath) as? T
    }
}
