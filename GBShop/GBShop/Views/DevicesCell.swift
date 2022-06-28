//
//  DevicesCell.swift
//  GBShop
//
//  Created by Григорий Виняр on 28/06/2022.
//

import UIKit

class DevicesCell: UITableViewCell {
    
    static let identifier = "DevicesCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Ноутбук"
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "123"
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "10000"
        return label
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemYellow
        return imageView
    }()
    
    lazy var stackWithLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.alignment =  .leading
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(photoImageView)
        self.addSubview(stackWithLabels)
        stackWithLabels.addArrangedSubview(idLabel)
        stackWithLabels.addArrangedSubview(nameLabel)
        stackWithLabels.addArrangedSubview(priceLabel)
        
        setStackWithLabelsConstraints()
        setPhotoImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackWithLabelsConstraints() {
        stackWithLabels.translatesAutoresizingMaskIntoConstraints                                                = false
        stackWithLabels.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive              = true
        stackWithLabels.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive                      = true
        stackWithLabels.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive               = true
        stackWithLabels.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: -10).isActive = true
    }
    
    private func setPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints                                      = false
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive            = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive     = true
        photoImageView.widthAnchor.constraint(equalToConstant: self.frame.width / 3).isActive         = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    }
    
}
