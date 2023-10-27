//
//  CryptoViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 25/10/23.
//

import UIKit

class CryptoViewController: UIViewController {
    
    let crypto = [
        Coin(name: "Bitcoin", image: "bitcoin", percentage: "+1,6%", money: "$29,850.15" , coins: "2.73 BTC", color: "#F6543E"),
        Coin(name: "Ethereum", image: "eth", percentage: "-0,82%", money: "$10,561.24 ", coins: "47.61 ETH", color: "#6374C3"),
        Coin(name: "Litecoin", image: "t", percentage: "-2,10%", money: "$3,676.76 ", coins: "39,27 LTC", color: "#30E0A1"),
        Coin(name: "Ripple", image: "xrp", percentage: "+0,27%", money: "$5,241.62 ", coins: "16447,65 XRP", color: "#638FFE"),
        Coin(name: "Ripple", image: "xrp", percentage: "+0,27%", money: "$5,241.62 ", coins: "16447,65 XRP", color: "#638FFE"),
        Coin(name: "Ripple", image: "xrp", percentage: "+0,27%", money: "$5,241.62 ", coins: "16447,65 XRP", color: "#638FFE"),
    ]

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Портфолио"
        label.font = UIFont(name: "Segoe UI Bold", size: 32)
        return label
    }()
    
    private lazy var settingImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cryptoSettings"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var checkAllLabel: UILabel = {
        let label = UILabel()
        label.text = "посмотреть все"
        label.font = UIFont(name: "Segoe UI", size: 14)
        label.textColor = UIColor(hex: "#F6543E")
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 88
        tableView.register(CryptoCustomTableViewCell.self, forCellReuseIdentifier: "cryptoCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(settingImage)
        view.addSubview(checkAllLabel)
        view.addSubview(tableView)
        
        [titleLabel, settingImage, checkAllLabel, tableView].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 79),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            settingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            settingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            settingImage.heightAnchor.constraint(equalToConstant: 24),
            settingImage.widthAnchor.constraint(equalToConstant: 24),
            
            checkAllLabel.topAnchor.constraint(equalTo: settingImage.bottomAnchor, constant: 44),
            checkAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            tableView.topAnchor.constraint(equalTo: checkAllLabel.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        ])
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crypto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCustomTableViewCell
        let temp = crypto[indexPath.row]
        cell.configure(color: temp.color, image: temp.image, name: temp.name, percentage: temp.percentage, money: temp.money, coins: temp.coins)
        return cell
    }
    
    
}
