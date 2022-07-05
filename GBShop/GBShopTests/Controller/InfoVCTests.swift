//
//  InfoVCTests.swift
//  GBShopTests
//
//  Created by Григорий Виняр on 05/07/2022.
//

import XCTest
@testable import GBShop

class InfoVCTests: XCTestCase {

    var sut: InfoVC!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = InfoVC(device: Device(id: nil, name: nil, price: nil))
        sut.infoView = InfoView()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        try super.tearDownWithError()
    }

    func testWhenViewIsLoadedPhotoImageViewNotNil() {
        XCTAssertNotNil(sut.infoView.photoImageView)
    }
    
    func testWhenViewIsLoadedNameLabelNotNil() {
        XCTAssertNotNil(sut.infoView.nameLabel)
    }
    
    func testWhenViewIsIdLabelNotNil() {
        XCTAssertNotNil(sut.infoView.idLabel)
    }
    
    func testWhenViewIsLoadedPriceLabelNotNil() {
        XCTAssertNotNil(sut.infoView.priceLabel)
    }

}
