//
//  InfoView.swift
//  GBShop
//
//  Created by Григорий Виняр on 28/06/2022.
//

import UIKit

class InfoView: UIView {
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "macbook")
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "MacBook"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1000"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.alignment = .leading
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.addSubview(nameLabel)
        self.addSubview(photoImageView)
        self.addSubview(labelStack)
        labelStack.addArrangedSubview(idLabel)
        labelStack.addArrangedSubview(priceLabel)
        
        setNameLabelConstraints()
        setPhotoImageViewConstraints()
        setLabelStackConstraits()
        
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupProperties() {
        nameLabel.text = "MacBook"
        photoImageView.image = UIImage(named: "macbook")
        idLabel.text = "Id товара:   123"
        priceLabel.text = "Цена товара:   45000"
    }
    
    private func setLabelStackConstraits() {
        labelStack.translatesAutoresizingMaskIntoConstraints                                         = false
        labelStack.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 50).isActive = true
        labelStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                    = true
        labelStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive      = true
    }
    
    private func setPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints                                    = false
        photoImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50).isActive = true
        photoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive               = true
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive                       = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
    }
    
    private func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints                             = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive        = true
    }
    
}
