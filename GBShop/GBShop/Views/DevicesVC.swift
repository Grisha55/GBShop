//
//  DevicesVC.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import UIKit

class DevicesVC: UIViewController {

    private var devicePresenter = DevicePresenter()
    
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
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.frame
    }
    
}

extension DevicesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
