//
//  DevicesCellTests.swift
//  GBShopTests
//
//  Created by Григорий Виняр on 05/07/2022.
//

import XCTest
@testable import GBShop

class DevicesCellTests: XCTestCase {

    var cell: DevicesCell!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let controller = DevicesVC()
        controller.devicePresenter = DevicePresenter()
        controller.devicePresenter.networkService = NetworkService()
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView.dataSource = dataSource
        
        cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DevicesCell.self), for: IndexPath(row: 0, section: 0)) as? DevicesCell
    }

    override func tearDownWithError() throws {
        cell = nil
        
        try super.tearDownWithError()
    }

    func testCellHasNameLabel() {
        XCTAssertNotNil(cell.nameLabel)
    }
    
    func testCellHasIdLabel() {
        XCTAssertNotNil(cell.idLabel)
    }
    
    func testCellHasPriceLabel() {
        XCTAssertNotNil(cell.priceLabel)
    }
    
    func testCellHasPhotoImageView() {
        XCTAssertNotNil(cell.photoImageView)
    }
    
    func testConfigureSetsName() {
        let device = Device(id: 1, name: "name", price: nil)
        cell.device = device
        
        XCTAssertEqual(cell.nameLabel.text, device.name)
    }
    
    func testConfigureSetsId() {
        let device = Device(id: 1, name: nil, price: nil)
        cell.device = device
        
        XCTAssertEqual(cell.idLabel.text, "\(device.id ?? 0)")
    }
    
    func testConfigureSetsPrice() {
        let device = Device(id: nil, name: nil, price: 100)
        cell.device = device
        
        XCTAssertEqual(cell.priceLabel.text, "\(device.price ?? 0)")
    }

}

extension DevicesCellTests {
    
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
