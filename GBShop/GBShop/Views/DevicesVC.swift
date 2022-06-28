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
        
        devicePresenter.getDevicesData()
        
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(devicePresenter.devices)
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DevicesCell.identifier, for: indexPath) as? DevicesCell else { return UITableViewCell() }
        
        return cell
    }
}
