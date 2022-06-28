//
//  Assembly.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import UIKit

class Assembly {
    
    class func buildInfoVC(device: Device) -> UIViewController {
        let view = InfoVC(device: device)
        
        return view
    }
    
    class func buildDevicesVC() -> UIViewController {
        let view = DevicesVC()
        let presenter = DevicePresenter()
        let networkService = NetworkService()
        
        view.devicePresenter = presenter
        presenter.deviceView = view
        presenter.networkService = networkService
        
        return view
    }
    
    class func buildLoginVC() -> UIViewController {
        let view = LoginVC()
        let loginView = LoginView()
        let registrationView = RegistrationView()
        
        view.loginView = loginView
        view.registrationView = registrationView
        
        return view
    }
    
}
