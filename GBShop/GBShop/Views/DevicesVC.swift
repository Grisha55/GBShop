//
//  DevicesVC.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import UIKit

protocol DevicesVCProtocol: AnyObject {
    
}

class DevicesVC: UIViewController, DevicesVCProtocol {

    var devicePresenter: DevicePresenterProtocol!
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Devices"
        
        configureTableView()
        
        self.devicePresenter.getDevicesData()
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.frame
        tableView.register(DevicesCell.self, forCellReuseIdentifier: DevicesCell.identifier)
    }
    
}

extension DevicesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devicePresenter.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DevicesCell.identifier, for: indexPath) as? DevicesCell else { return UITableViewCell() }
        cell.device = devicePresenter.devices[indexPath.row]
        return cell
    }
}
