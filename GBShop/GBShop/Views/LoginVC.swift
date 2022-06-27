//
//  LoginVC.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import UIKit

class LoginVC: UIViewController {

    private var loginView = LoginView()
    private var registrationView = RegistrationView()
    
    override func loadView() {
        super.loadView()
        self.view = RegistrationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.loginViewDelegate = self
        registrationView.registrationViewDelegate = self
        
        setupNavBar()
    }
    

    private func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Войти"
        let registrationButton = UIBarButtonItem(title: "Регистрация", style: .plain, target: self, action: #selector(registerButtonAction))
        registrationButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = registrationButton
    }
    
    @objc
    func registerButtonAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Войти", style: .plain, target: self, action: #selector(logInButtonAction))
        self.view = registrationView
        self.title = "Регистрация"
    }
    
    @objc
    func logInButtonAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Регистрация", style: .plain, target: self, action: #selector(registerButtonAction))
        self.view = loginView
        self.title = "Вход"
    }
}

extension LoginVC: RegistrationViewDelegate {
    
    func registrationButtonAction() {
        print("It's working")
    }
    
}

extension LoginVC: LoginViewDelegate {
    
    func logInAction() {
        // Здесь будет переход на основной экран
        print("It's working")
    }
}
