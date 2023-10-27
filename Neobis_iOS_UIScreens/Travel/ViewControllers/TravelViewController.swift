//
//  TravelViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 27/10/23.
//

import UIKit

class TravelViewController: UIViewController {
    
    let cities = [
        City(image: "city1", name: "ABU DHABI"),
        City(image: "city2", name: "SAN ANTONIO"),
        City(image: "city1", name: "ABU DHABI")
    ]
    
    private lazy var title1: UILabel = {
        let label = UILabel()
        label.text = "Путешествуйте"
        label.font = UIFont(name: "NotoSans-Medium", size: 24)
        return label
    }()
    
    private lazy var title2: UILabel = {
        let label = UILabel()
        label.text = "Почувствуйте прилив энергии"
        label.font = UIFont(name: "NotoSans-Medium", size: 24)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте."
        label.font = UIFont(name: "NotoSans-Regular", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Куда хотите поехать?"
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Куда хотите поехать?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
//        searchBar.layer.borderWidth = 0.1
//        searchBar.layer.borderColor = UIColor.lightGray.cgColor
//        searchBar.layer.shadowColor = UIColor.black.cgColor
//        searchBar.layer.shadowOpacity = 0.5
//        searchBar.layer.shadowOffset = CGSize(width: 0, height: 1)
//        searchBar.layer.shadowRadius = 1
        searchBar.delegate = self
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 10
        searchBar.layer.borderColor = UIColor.clear.cgColor
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 57
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 14, left: 0, bottom: 14, right: 0)
        tableView.rowHeight = 250
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TravelCustomTableViewCell.self, forCellReuseIdentifier: "travelCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    

    func setupConstraints() {
        view.addSubview(title1)
        view.addSubview(title2)
        view.addSubview(descriptionLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        [title1, title2, descriptionLabel, searchBar, tableView].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            title1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title1.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            
            title2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title2.topAnchor.constraint(equalTo: title1.bottomAnchor, constant: 1),
            
            descriptionLabel.topAnchor.constraint(equalTo: title2.bottomAnchor, constant: 11),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51),
            
            searchBar.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 27),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

extension TravelViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelCustomTableViewCell
        cell.configure(image: cities[indexPath.row].image, name: cities[indexPath.row].name)
        return cell
    }
    
    
}
