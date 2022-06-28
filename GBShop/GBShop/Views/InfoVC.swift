//
//  InfoVC.swift
//  GBShop
//
//  Created by Григорий Виняр on 28/06/2022.
//

import UIKit

protocol InfoVCInput: AnyObject {
    var device: Device { get }
}

class InfoVC: UIViewController, InfoVCInput {

    var device: Device
    
    override func loadView() {
        super.loadView()
        let infoView = InfoView()
        self.view = infoView
    }
    
    init(device: Device) {
        self.device = device
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
