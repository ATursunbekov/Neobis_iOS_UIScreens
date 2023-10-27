//
//  FinanceViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 26/10/23.
//

import UIKit

class FinanceViewController: UIViewController {
    
    let expensesData = [
        Expense(name: "Дом", image: "home", cost: "$321", goal: "Продукты", color: "#FFC328"),
        Expense(name: "Покупки", image: "tag", cost: "$574", goal: "Одежда", color: "#3C009E"),
        Expense(name: "Транспорт", image: "smile", cost: "$124", goal: "Такси", color: "#9CC741"),
        Expense(name: "Здоровье", image: "heart", cost: "$765", goal: "Лечение", color: "#C141CC"),
        Expense(name: "Фитнес", image: "cookie", cost: "$324", goal: "Тренировки", color: "#1F86FF"),
        Expense(name: "Счета", image: "mail", cost: "$726", goal: "Комунальные", color: "#21C0E3"),
        Expense(name: "Ресторан", image: "heart", cost: "$325", goal: "Ужин", color: "#C141CC"),
    ]

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()
    
    private lazy var moneyAmount: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.font = UIFont(name: "Inter-ExtraBold", size: 36)
        return label
    }()
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.text = "Апрель 2020"
        label.font = UIFont(name: "Inter-Regular", size: 18)
        return label
    }()
    
    private lazy var arrowLeft: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.left"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    private lazy var arrowRight: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        return image
    }()
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 31
        return mainView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 57
        tableView.showsVerticalScrollIndicator = false
        tableView.register(FinanceCustomTableViewCell.self, forCellReuseIdentifier: "financeCell")
        return tableView
    }()
    
    private lazy var etcLabel: UILabel = {
        let label = UILabel()
        label.text = "См. ещё"
        label.font = UIFont(name: "Inter-Regular", size: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#FAFAFA")
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(moneyAmount)
        view.addSubview(date)
        view.addSubview(arrowLeft)
        view.addSubview(arrowRight)
        view.addSubview(mainView)
        view.addSubview(tableView)
        view.addSubview(etcLabel)
        
        [titleLabel, moneyAmount, date, arrowLeft, arrowRight, mainView, tableView, etcLabel].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            moneyAmount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moneyAmount.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            date.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            date.topAnchor.constraint(equalTo: moneyAmount.bottomAnchor, constant: 30),
            
            arrowLeft.heightAnchor.constraint(equalToConstant: 15),
            arrowLeft.widthAnchor.constraint(equalToConstant: 15),
            arrowLeft.centerYAnchor.constraint(equalTo: date.centerYAnchor),
            arrowLeft.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -44),
            
            arrowRight.heightAnchor.constraint(equalToConstant: 15),
            arrowRight.widthAnchor.constraint(equalToConstant: 15),
            arrowRight.centerYAnchor.constraint(equalTo: date.centerYAnchor),
            arrowRight.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 44),
            
            mainView.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 45),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 494),
            
            tableView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 18),
            tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            tableView.heightAnchor.constraint(equalToConstant: 390),
            
            etcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            etcLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 33)
        ])
        
    }
}

extension FinanceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expensesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "financeCell", for: indexPath) as! FinanceCustomTableViewCell
        let temp = expensesData[indexPath.row]
        cell.configure(color: temp.color, image: temp.image, title: temp.name, cost: temp.cost, desc: temp.goal)
        return cell
    }
    
    
}
