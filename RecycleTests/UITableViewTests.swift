//
//  RecycleTests.swift
//  RecycleTests
//
//  Created by Mateus Pinheiro on 07/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import XCTest
import UIKit
@testable import Recycle

class UITableViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }
    
    func testCellRegistration() {
        let tableView = UITableView()
        tableView.registerRecyclableCells(CellOne.self)

        let klassNibs = tableView.value(forKey: "_nibMap") as? [String: Any]
        XCTAssert(klassNibs?["CellOne"] != nil)
    }

    func testMultipleCellRegistration() {
        let tableView = UITableView()
        tableView.registerRecyclableCells(CellOne.self, CellTwo.self)

        let klassNibs = tableView.value(forKey: "_nibMap") as? [String: Any]
        XCTAssert(klassNibs?["CellOne"] != nil && klassNibs?["CellTwo"] != nil)
    }

    func testIgnoreNonConformantCells() {
        let tableView = UITableView()
        tableView.registerRecyclableCells(CellNotRecyclable.self)

        let klassNibs = tableView.value(forKey: "_nibMap") as? [String: Any]
        XCTAssert(klassNibs?["CellNotRecyclable"] == nil)
    }

    func testIgnoreNonConformatCellsAmongOthers() {
        let tableView = UITableView()
        tableView.registerRecyclableCells(CellOne.self, CellNotRecyclable.self)

        let klassNibs = tableView.value(forKey: "_nibMap") as? [String: Any]
        XCTAssert(klassNibs?["CellOne"] != nil && klassNibs?["CellNotRecyclable"] == nil)
    }

    func testCellRecycling() {
        let tableView = UITableView()
        tableView.registerRecyclableCells(CellOne.self, CellNotRecyclable.self)

        let cell = tableView.recycle(CellOne.self)
        XCTAssert(cell != nil)
    }

    func testMultipleCellRecycling() {
        let tableView = UITableView()
        tableView.registerRecyclableCells(CellOne.self, CellTwo.self, CellNotRecyclable.self)

        let cellOne = tableView.recycle(CellOne.self)
        let cellTwo = tableView.recycle(CellTwo.self)
        XCTAssert(cellOne != nil && cellTwo != nil)
    }
    
}
