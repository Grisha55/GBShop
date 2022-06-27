//
//  RegistrationView.swift
//  GBShop
//
//  Created by Григорий Виняр on 27/06/2022.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func registrationButtonAction()
}

class RegistrationView: UIView {
    
    var registrationViewDelegate: RegistrationViewDelegate!
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Придумайте имя пользователя"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var userNameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пример: leon125"
        tf.borderStyle = .bezel
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Придумайте пароль"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пример: Name.34334"
        tf.borderStyle = .bezel
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var loginStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    lazy var passwordStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.addTarget(registrationViewDelegate, action: #selector(registrationButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(loginStack)
        self.addSubview(passwordStack)
        loginStack.addArrangedSubview(userNameLabel)
        loginStack.addArrangedSubview(userNameTF)
        passwordStack.addArrangedSubview(passwordLabel)
        passwordStack.addArrangedSubview(passwordTF)
        self.addSubview(registrationButton)
        
        setLoginStackConstraints()
        setPasswordStackConstraints()
        setRegistrationButtonConstraints()
        setLoginTFConstraints()
        setPasswordTFConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func registrationButtonAction() {
        registrationViewDelegate.registrationButtonAction()
    }
    
    private func setLoginStackConstraints() {
        loginStack.translatesAutoresizingMaskIntoConstraints                                    = false
        loginStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive        = true
        loginStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive               = true
        loginStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        loginStack.heightAnchor.constraint(equalToConstant: 100).isActive                       = true
    }
    
    private func setPasswordStackConstraints() {
        passwordStack.translatesAutoresizingMaskIntoConstraints                                     = false
        passwordStack.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 20).isActive = true
        passwordStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                = true
        passwordStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive  = true
        passwordStack.heightAnchor.constraint(equalToConstant: 100).isActive                        = true
    }
    
    private func setRegistrationButtonConstraints() {
        registrationButton.translatesAutoresizingMaskIntoConstraints                                        = false
        registrationButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 50).isActive = true
        registrationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                   = true
        registrationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive     = true
        registrationButton.heightAnchor.constraint(equalToConstant: 50).isActive                            = true
    }
    
    private func setLoginTFConstraints() {
        userNameTF.translatesAutoresizingMaskIntoConstraints                                             = false
        userNameTF.trailingAnchor.constraint(equalTo: loginStack.trailingAnchor, constant: -40).isActive = true
    }
    
    private func setPasswordTFConstraints() {
        passwordTF.translatesAutoresizingMaskIntoConstraints                                             = false
        passwordTF.trailingAnchor.constraint(equalTo: loginStack.trailingAnchor, constant: -40).isActive = true
    }
    
}
