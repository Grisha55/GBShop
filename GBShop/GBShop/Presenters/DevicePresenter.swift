//
//  DevicePresenter.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import Foundation

protocol DevicePresenterProtocol: AnyObject {
    func getDevicesData()
    var devices: [Device] { get set }
    var networkService: NetworkServiceProtocol! { get set }
}

class DevicePresenter: DevicePresenterProtocol {
    
    weak var deviceView: DevicesVCProtocol!
    
    var networkService: NetworkServiceProtocol!
    
    var devices = [Device]()
    
    func getDevicesData() {
        let urlString = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"
        let queryItems = [URLQueryItem(name: "page_number", value: "1"),
                          URLQueryItem(name: "id_category", value: "1")
        ]
        self.networkService.fetchData(urlString: urlString, queryItems: queryItems) { [weak self] (allDevices: [Device]) in
            self?.devices = allDevices
        }
    }
}
