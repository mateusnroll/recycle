//
//  CollectionCells.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import UIKit
import Recycle

class CollectionCellOne: UICollectionViewCell, Recyclable {
    static var bundle: Bundle? = Bundle(for: CollectionCellOne.self)
}

class CollectionCellTwo: UICollectionViewCell, Recyclable {
    static var bundle: Bundle? = Bundle(for: CollectionCellTwo.self)
}
