//
//  LoginVCTests.swift
//  GBShopTests
//
//  Created by Григорий Виняр on 05/07/2022.
//

import XCTest
@testable import GBShop

class LoginVCTests: XCTestCase {

    var sut: LoginVC!
    var devicesVC: DevicesVC!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LoginVC()
        devicesVC = DevicesVC()
        devicesVC.devicePresenter = DevicePresenter()
        devicesVC.devicePresenter
        sut.loginView = LoginView()
        sut.registrationView = RegistrationView()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        devicesVC = nil
        
        try super.tearDownWithError()
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.loginView)
    }
    
    func testWhenViewIsLoadedLoginTFNotNil() {
        XCTAssertNotNil(sut.loginView.loginTF)
    }

    func testWhenViewIsLoadedLoginLabelNotNil() {
        XCTAssertNotNil(sut.loginView.loginLabel)
    }
    
    func testWhenViewIsLoadedPasswordLabelNotNil() {
        XCTAssertNotNil(sut.loginView.loginTF)
    }
    
    func testWhenViewIsLoadedPasswordTFNotNil() {
        XCTAssertNotNil(sut.loginView.passwordTF)
    }
    
    func testWhenViewIsLoadedLoginButtonNotNil() {
        XCTAssertNotNil(sut.loginView.logInButton)
    }
    
    func presentingDevicesVC() -> DevicesVC {
        UIApplication.shared.keyWindow?.rootViewController = sut
        
        return devicesVC
    }
    
    func testLoginButtonPresentsDevicesVC() {
        let devicesVC = presentingDevicesVC()
        XCTAssertNotNil(devicesVC.tableView)
    }

}

extension LoginVCTests {
    
    class MockTableView: UITableView {
        var isReloaded = false
        
        override func reloadData() {
            isReloaded = true
        }
    }
}

extension LoginVCTests {
    
    class MockNavigationController: UINavigationController {
        var pushedVC: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedVC = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}
