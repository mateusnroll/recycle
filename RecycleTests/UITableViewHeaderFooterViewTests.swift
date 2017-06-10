//
//  UITableViewHeaderFooterViewTests.swift
//  Recycle
//
//  Created by Mateus Pinheiro on 09/06/17.
//  Copyright © 2017 Mateus Pinheiro. All rights reserved.
//

import XCTest

class UITableViewHeaderFooterViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }
    
    func testHeaderFooterRegistration() {
        let tableView = UITableView()
        tableView.registerRecyclableHeaderFooterViews(HeaderOne.self)

        let header = tableView.recycleHeaderFooter(HeaderOne.self)
        XCTAssert(header != nil)
    }

    func testMultipleHeaderRegistration() {
        let tableView = UITableView()
        tableView.registerRecyclableHeaderFooterViews(HeaderOne.self, HeaderTwo.self)

        let headerOne = tableView.recycleHeaderFooter(HeaderOne.self)
        let headerTwo = tableView.recycleHeaderFooter(HeaderTwo.self)
        XCTAssert(headerOne != nil && headerTwo != nil)
    }

    func testIgnoreNonConformatCellsAmongOthers() {
        let tableView = UITableView()
        tableView.registerRecyclableHeaderFooterViews(HeaderOne.self, HeaderTwo.self, HeaderNotRecyclable.self)

        let headerOne = tableView.recycleHeaderFooter(HeaderOne.self)
        let headerTwo = tableView.recycleHeaderFooter(HeaderTwo.self)
        XCTAssert(headerOne != nil && headerTwo != nil)
    }
    
}
