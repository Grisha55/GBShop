//
//  DevicePresenter.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import Foundation

protocol DevicePresenterProtocol: AnyObject {
    func getDevicesData()
}

class DevicePresenter: DevicePresenterProtocol {
    
    weak var deviceView: DevicesVCProtocol!
    
    var networkService: NetworkServiceProtocol!
    
    var devices = [Device]()
    
    func getDevicesData() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/имяФайла.json"
        self.networkService.fetchData(urlString: urlString) { [weak self] (allDevices: AllDevices) in
            self?.devices = allDevices.products
        }
    }
}
