//
//  Cells.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import UIKit
@testable import Recycle

class CellOne: UITableViewCell, RecyclableTableViewCell {
    static var bundle: Bundle? = Bundle(for: CellOne.self)
}

class CellTwo: UITableViewCell, RecyclableTableViewCell {
    static var bundle: Bundle? = Bundle(for: CellTwo.self)
}

class CellNotRecyclable: UITableViewCell { }
