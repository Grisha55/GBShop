//
//  DevicePresenter.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import Foundation

protocol DevicePresenterProtocol {
    
}

class DevicePresenter: DevicePresenterProtocol {
    
    weak var deviceView = DevicesVC()
    private var networkService = NetworkService()
    var devices = [Device]()
    
    func getDevicesData() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/имяФайла.json"
        self.networkService.fetchData(urlString: urlString) { [weak self] (allDevices: AllDevices) in
            self?.devices = allDevices.products
        }
    }
}
