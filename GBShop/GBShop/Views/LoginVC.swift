//
//  LoginVC.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import UIKit

class LoginVC: UIViewController {

    var loginView: LoginView!
    var registrationView: RegistrationView!
    
    override func loadView() {
        super.loadView()
        self.view = registrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.loginViewDelegate = self
        registrationView.registrationViewDelegate = self
        
        setupNavBar()
    }
    

    private func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Регистрация"
        let registrationButton = UIBarButtonItem(title: "Войти", style: .plain, target: self, action: #selector(registerButtonAction))
        registrationButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = registrationButton
    }
    
    @objc
    func registerButtonAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Войти", style: .plain, target: self, action: #selector(logInButtonAction))
        self.view = loginView
        self.title = "Вход"
    }
    
    @objc
    func logInButtonAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Регистрация", style: .plain, target: self, action: #selector(registerButtonAction))
        self.view = registrationView
        self.title = "Регистрация"
    }
}

extension LoginVC: RegistrationViewDelegate {
    
    func registrationButtonAction() {
        navigationController?.pushViewController(Assembly.buildDevicesVC(), animated: true)
    }
    
}

extension LoginVC: LoginViewDelegate {
    
    func logInAction() {
        navigationController?.pushViewController(Assembly.buildDevicesVC(), animated: true)
    }
}
