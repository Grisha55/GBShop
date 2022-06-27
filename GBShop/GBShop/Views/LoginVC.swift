//
//  LoginVC.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import UIKit

class LoginVC: UIViewController {

    private var loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.loginViewDelegate = self
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
        // Тут будет меняться вьюха на регистрационную
        print("Registration")
    }
}

extension LoginVC: LoginViewDelegate {
    
    func logInAction() {
        // Здесь будет переход на основной экран
        print("It's working")
    }
}
