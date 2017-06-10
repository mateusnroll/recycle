//
//  Headers.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import UIKit
import Recycle

class HeaderOne: UITableViewHeaderFooterView, Recyclable {
    static var bundle: Bundle? = Bundle(for: HeaderOne.self)
}

class HeaderTwo: UITableViewHeaderFooterView, Recyclable {
    static var bundle: Bundle? = Bundle(for: HeaderTwo.self)
}

class HeaderNotRecyclable: UITableViewHeaderFooterView { }
