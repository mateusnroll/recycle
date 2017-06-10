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
    /**
     Registers recyclable UICollectionViewsCell(s) to the UICollectionView. 
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
            self.register(nib, forCellWithReuseIdentifier: cell.identifier)
        } else {
            self.register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }

    /**
     Retrieves a registered recyclable cell from the UICollectionView

     - parameter cell: Cell to be retrieved
     */
    func recycle<T: Recyclable>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as? T
    }
}

// MARK: - UICollectionReusableView

public extension UICollectionView {
    /**
     Registers recyclable UIcollectionReusableView(s) to the UICollectionView.
     All views need to conform to the Recyclable protocol.

     - parameter views: One or more Recyclable-compliant views
     */
    func registerSupplementaryViews(_ views: AnyObject...) {
        for view in views {
            if let view = view.self as? Recyclable.Type {
                registerSupplementaryView(view)
            } else {
                print("[ERROR] Recyclable: Can not register view, does not conform to protocol.", view)
            }
        }
    }

    private func registerSupplementaryView(_ view: Recyclable.Type) {
        if let nib = view.nib {
            self.register(nib, forSupplementaryViewOfKind: view.kind ?? "", withReuseIdentifier: view.identifier)
        } else {
            self.register(view.self, forSupplementaryViewOfKind: view.kind ?? "", withReuseIdentifier: view.identifier)
        }
    }

    /**
     Retrieves a registered recyclable supplementary view from the UICollectionView

     - parameter view: View to be retrieved
     */
    func recycleSupplementaryView<T: Recyclable>(_ view: Recyclable.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableSupplementaryView(ofKind: view.kind ?? "", withReuseIdentifier: view.identifier, for: indexPath) as? T
    }
}
