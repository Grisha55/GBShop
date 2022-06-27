//
//  LoginView.swift
//  GBShop
//
//  Created by Григорий Виняр on 26/06/2022.
//

import UIKit

protocol LoginViewDelegate {
    func logInAction()
}

class LoginView: UIView {
    
    var loginViewDelegate: LoginViewDelegate!
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя пользователя"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        return label
    }()
    
    lazy var loginTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите имя пользователя"
        tf.borderStyle = .bezel
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        label.textColor = .lightGray
        label.text = "Enter your password"
        return label
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your password"
        tf.borderStyle = .bezel
        return tf
    }()
    
    lazy var loginStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        stack.alignment = .leading
        return stack
    }()
    
    lazy var passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1
        stack.alignment = .leading
        return stack
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.addTarget(loginViewDelegate, action: #selector(logInButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(loginStack)
        self.addSubview(passwordStack)
        loginStack.addArrangedSubview(loginLabel)
        loginStack.addArrangedSubview(loginTF)
        passwordStack.addArrangedSubview(passwordLabel)
        passwordStack.addArrangedSubview(passwordTF)
        self.addSubview(logInButton)
        
        setLoginStackViewConstraints()
        setPasswordStackViewConstraints()
        setLoginTFContstraints()
        setPasswordTFConstraints()
        setLogInButtonConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func logInButtonAction() {
        loginViewDelegate.logInAction()
    }
    
    private func setLoginStackViewConstraints() {
        loginStack.translatesAutoresizingMaskIntoConstraints                                            = false
        loginStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive                = true
        loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                       = true
        loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive         = true
        loginStack.heightAnchor.constraint(equalToConstant: 100).isActive                               = true
    }
    
    private func setPasswordStackViewConstraints() {
        passwordStack.translatesAutoresizingMaskIntoConstraints                                            = false
        passwordStack.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 20).isActive        = true
        passwordStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                       = true
        passwordStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive         = true
        passwordStack.heightAnchor.constraint(equalToConstant: 100).isActive                               = true
    }
    
    private func setLoginTFContstraints() {
        loginTF.translatesAutoresizingMaskIntoConstraints                                             = false
        loginTF.trailingAnchor.constraint(equalTo: loginStack.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setPasswordTFConstraints() {
        passwordTF.translatesAutoresizingMaskIntoConstraints                                                = false
        passwordTF.trailingAnchor.constraint(equalTo: passwordStack.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setLogInButtonConstraints() {
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 50).isActive = true
        logInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                   = true
        logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive     = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive                            = true
    }
}
