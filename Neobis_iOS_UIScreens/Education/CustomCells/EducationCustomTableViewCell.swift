//
//  EducationCustomTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 27/10/23.
//

import Foundation
import UIKit

class EducationCustomTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI", size: 30)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var arrowRight: UIImageView = {
        let image = UIImageView(image: UIImage(named: "educationArrow"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupConstraints()
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: -1, height: 1)
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(cellImage)
        contentView.addSubview(arrowRight)
        
        [titleLabel, descriptionLabel, cellImage, arrowRight].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            arrowRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            
            cellImage.heightAnchor.constraint(equalToConstant: 60),
            cellImage.widthAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    func configure(title: String, desc: String, image: String, isRight: Bool) {
        titleLabel.text = title
        descriptionLabel.text = desc
        cellImage.image = UIImage(named: image)
        
        if isRight {
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
                descriptionLabel.trailingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: -24),
                
                cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellImage.trailingAnchor.constraint(equalTo: arrowRight.leadingAnchor, constant: -9)
            ])
        } else {
            NSLayoutConstraint.activate([
                cellImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
                
                titleLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 35),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                
                descriptionLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 35),
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
                descriptionLabel.trailingAnchor.constraint(equalTo: arrowRight.leadingAnchor, constant: -17),
            ])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
