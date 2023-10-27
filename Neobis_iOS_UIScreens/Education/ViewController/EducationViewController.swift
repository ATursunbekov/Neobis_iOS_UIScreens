//
//  TravelViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 27/10/23.
//

import UIKit

class EducationViewController: UIViewController {
    
    let topics = [
        Topic(title: "SOS", description: "Mini meltdown? Get some Headspace in a hurry", image: "book", isRight: true),
        Topic(title: "On-the-Go", description: "Mindful living? Get your Headspace to go", image: "books", isRight: false),
        Topic(title: "Classic", description: "Like it simple? Get some extra Headspace", image: "certificate", isRight: true),
        Topic(title: "SOS", description: "Mini meltdown? Get some Headspace in a hurry", image: "globus", isRight: false)
    ]
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Singles"
        label.font = UIFont(name: "Segoe UI", size: 22)
        return label
    }()
    
    private lazy var searchImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var menuImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "burger"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 174
        tableView.register(EducationCustomTableViewCell.self, forCellReuseIdentifier: "educationCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(searchImage)
        view.addSubview(menuImage)
        view.addSubview(tableView)
        
        [titleLabel, searchImage, menuImage, tableView].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
            menuImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            menuImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            menuImage.heightAnchor.constraint(equalToConstant: 24),
            menuImage.widthAnchor.constraint(equalToConstant: 24),
            
            searchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            searchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            searchImage.heightAnchor.constraint(equalToConstant: 24),
            searchImage.widthAnchor.constraint(equalToConstant: 24),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension EducationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "educationCell", for: indexPath) as! EducationCustomTableViewCell
        let temp = topics[indexPath.row]
        cell.configure(title: temp.title, desc: temp.description, image: temp.image, isRight: temp.isRight)
        return cell
    }
    
    
}
