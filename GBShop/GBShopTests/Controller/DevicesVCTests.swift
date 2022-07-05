//
//  DevicesVCTests.swift
//  GBShopTests
//
//  Created by Григорий Виняр on 05/07/2022.
//

import XCTest
@testable import GBShop

class DevicesVCTests: XCTestCase {

    var sut: DevicesVC!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = DevicesVC()
        sut.devicePresenter = DevicePresenter()
        sut.devicePresenter.networkService = NetworkService()
        
        sut.loadViewIfNeeded()
        
        tableView = sut.tableView
        tableView.delegate = sut
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        
        try super.tearDownWithError()
    }

    func testNumberOfRowsIsDevicesCount() {
        sut.devicePresenter.devices.append(Device(id: 1, name: nil, price: nil))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.devicePresenter.devices.append(Device(id: 2, name: nil, price: nil))
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut.devicePresenter.devices.append(Device(id: 1, name: nil, price: nil))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is DevicesCell)
    }
    
    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        
        sut.devicePresenter.devices.append(Device(id: 1, name: nil, price: nil))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellIsDequeued)
    }
    
    func testCellForRowCallsConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        
        let device = Device(id: 1, name: nil, price: 45600)
        let device2 = Device(id: 2, name: nil, price: nil)
        sut.devicePresenter.devices.append(device)
        sut.devicePresenter.devices.append(device2)
        
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTaskCell
        
        XCTAssertEqual(cell.device, device)
    }

}

extension DevicesVCTests {
    
    class MockTableView: UITableView {
        
        var cellIsDequeued = false
        
        static func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 375, height: 658), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockTaskCell.self, forCellReuseIdentifier: String(describing: DevicesCell.self))
            return mockTableView
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
    }
    
    class MockTaskCell: DevicesCell {
        
        func configure(withDevice device: Device) {
            self.device = device
        }
    }
}
