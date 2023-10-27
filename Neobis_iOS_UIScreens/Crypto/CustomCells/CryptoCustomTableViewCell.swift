//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 25/10/23.
//

import Foundation
import UIKit

class CryptoCustomTableViewCell: UITableViewCell {
    
    private lazy var logoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        //view.layer.opacity = 0.1
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var coinTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI Bold", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var profitPerc: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI", size: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var moneyAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI Bold", size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var coinAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI", size: 12)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.backgroundColor = UIColor.clear.cgColor
        selectionStyle = .none
        backgroundColor = .clear
        setupConstraints()
    }
    
    func setupConstraints() {
        
        contentView.addSubview(logoView)
        contentView.addSubview(logoImage)
        contentView.addSubview(coinTitle)
        contentView.addSubview(profitPerc)
        contentView.addSubview(moneyAmount)
        contentView.addSubview(coinAmount)
        
        [logoView, logoImage, coinTitle, profitPerc, moneyAmount, coinAmount].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            logoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 56),
            logoView.widthAnchor.constraint(equalToConstant: 56),
            
            logoImage.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 22),
            logoImage.widthAnchor.constraint(equalToConstant: 22),
            
            coinTitle.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 12),
            coinTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            profitPerc.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 12),
            profitPerc.topAnchor.constraint(equalTo: coinTitle.bottomAnchor, constant: 3),
            
            moneyAmount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moneyAmount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23),
            
            coinAmount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coinAmount.topAnchor.constraint(equalTo: moneyAmount.bottomAnchor, constant: 3),
        ])
    }
    
    func configure(color: String, image: String, name: String, percentage: String, money: String, coins: String) {
        logoView.backgroundColor = UIColor(hex: color, alpha: 0.1)
        logoImage.image = UIImage(named: image)
        coinTitle.text = name
        profitPerc.text = percentage
        moneyAmount.text = money
        coinAmount.text = coins
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
