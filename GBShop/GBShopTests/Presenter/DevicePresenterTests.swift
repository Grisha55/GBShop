//
//  DevicePresenterTests.swift
//  GBShopTests
//
//  Created by Григорий Виняр on 05/07/2022.
//

import XCTest
@testable import GBShop

class DevicePresenterTests: XCTestCase {

    var sut: DevicePresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = DevicePresenter()
        sut.networkService = NetworkService()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetDeviceDataURLForHost() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        
        guard let url = URL(string: urlString) else { return }
        
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        
        XCTAssertEqual(urlComponents.host, "raw.githubusercontent.com")
    }
    
    func testGetDeviceDataURLForPath() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
        
        guard let url = URL(string: urlString) else { return }
        
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        
        XCTAssertEqual(urlComponents.path, "/GeekBrainsTutorial/online-store-api/master/responses/login.json")
    }
    
    func testGetDeviceDataFromServer() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"
        let queryItems = [URLQueryItem(name: "page_number", value: "1"),
                          URLQueryItem(name: "id_category", value: "1")
        ]
        sut.networkService.fetchData(urlString: urlString, queryItems: queryItems) { (allDevices: [Device]) in
            XCTAssertNotNil(allDevices)
        }
    }
    
}
