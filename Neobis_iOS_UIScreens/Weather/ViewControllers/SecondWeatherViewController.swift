//
//  SecondWeatherViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 22/10/23.
//

import UIKit

class SecondWeatherViewController: UIViewController {
    
    private lazy var hourlyWeather = [
        WeatherModel(temp: "29°C", image: "sunAndClouds", time: "15:00"),
        WeatherModel(temp: "26°C", image: "sunAndClouds", time: "16:00"),
        WeatherModel(temp: "24°C", image: "clouds", time: "17:00"),
        WeatherModel(temp: "23°C", image: "cloudsWithMoon", time: "18:00"),
        WeatherModel(temp: "22°C", image: "cloudsWithMoon", time: "19:00"),
    ]
    
    private lazy var weeklyWeather = [
        WeatherModel(temp: "21°C", image: "rainy", time: "Апр, 27"),
        WeatherModel(temp: "22°C", image: "rainyCloud", time: "Апр, 28"),
        WeatherModel(temp: "34°C", image: "sun1", time: "Апр, 29"),
        WeatherModel(temp: "27°C", image: "cloudy", time: "Апр, 30"),
        WeatherModel(temp: "32°C", image: "sunAndClouds", time: "Май, 1"),
    ]

    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var backLabel: UILabel = {
        let label = UILabel()
        label.text = "Назад"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.textColor = .white
        label.addRegularShadow()
        return label
    }()
    
    private lazy var backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60, weight: .bold))
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    private lazy var settingImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "settigns")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: -2, height: 3)
        image.layer.cornerRadius = 1
        return image
    }()
    
    private lazy var firstDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.textColor = .white
        label.addRegularShadow()
        return label
    }()
    
    private lazy var secondDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Апр, 26"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = .white
        label.addRegularShadow()
        return label
    }()
    
    private lazy var dateView: UIView = UIView()
    
    private lazy var weekTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "На этой неделе"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.textColor = .white
        label.addRegularShadow()
        return label
    }()
    
    private lazy var calendarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "calendar"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: -2, height: 3)
        image.layer.cornerRadius = 1
        return image
    }()
    
    
    
    //MARK: CollectionView
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width * 70 / 414.0), height: 155)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(WeatherCustomCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var weekTitleView: UIView = UIView()
    
    private lazy var scrollViewBorder: UIView = {
        let scrollView = UIView()
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.white.cgColor
        scrollView.layer.cornerRadius = 5
        return scrollView
    }()
    
    private lazy var scrollViewFill: UIView = {
        let scrollView = UIView()
        scrollView.backgroundColor = .white
        scrollView.layer.cornerRadius = 5
        return scrollView
    }()
    
    private lazy var tableView: UITableView = {
        let  tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(WeatherCustomTableViewCell.self, forCellReuseIdentifier: "customTableViewCell")
        return tableView
    }()
    
    lazy var weatherConditionView: UIView = UIView()
    
    lazy var sunImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "whiteSun"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: -2, height: 3)
        image.layer.cornerRadius = 1
        return image
    }()
    
    lazy var weatherConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "AccuWeather"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = .white
        label.addRegularShadow()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupConstraints()
        setTargets()
    }
    
    func setupGradient() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0 / 255, green: 190 / 255, blue: 229 / 255, alpha: 1).cgColor, UIColor(red: 23 / 255, green: 154 / 255, blue: 250 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupConstraints() {
        view.addSubview(backButton)
        backButton.addSubview(backLabel)
        backButton.addSubview(backImage)
        view.addSubview(settingImage)
        view.addSubview(dateView)
        dateView.addSubview(firstDateLabel)
        dateView.addSubview(secondDateLabel)
        view.addSubview(collectionView)
        view.addSubview(weekTitleView)
        weekTitleView.addSubview(weekTitleLabel)
        weekTitleView.addSubview(calendarImage)
        view.addSubview(scrollViewBorder)
        scrollViewBorder.addSubview(scrollViewFill)
        view.addSubview(tableView)
        view.addSubview(weatherConditionView)
        weatherConditionView.addSubview(sunImage)
        weatherConditionView.addSubview(weatherConditionLabel)
        
        [backButton, backLabel, backImage, settingImage, dateView, firstDateLabel, secondDateLabel,
         collectionView, weekTitleView, weekTitleLabel, calendarImage, scrollViewFill, scrollViewBorder, tableView, weatherConditionView, sunImage, weatherConditionLabel].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
    
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 95),
            backButton.heightAnchor.constraint(equalToConstant: 37),
            
            backLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            backLabel.trailingAnchor.constraint(equalTo: backButton.trailingAnchor),
            
            backImage.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            backImage.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            backImage.heightAnchor.constraint(equalToConstant: 17),
            backImage.widthAnchor.constraint(equalToConstant: 11),
            
            settingImage.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            settingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            settingImage.heightAnchor.constraint(equalToConstant: 24),
            settingImage.widthAnchor.constraint(equalToConstant: 24),
            
            dateView.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 49),
            dateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            
            firstDateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            firstDateLabel.leadingAnchor.constraint(equalTo: dateView.leadingAnchor),
            
            secondDateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            secondDateLabel.trailingAnchor.constraint(equalTo: dateView.trailingAnchor),
                
            collectionView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 155),
            
            weekTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            weekTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            weekTitleView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            weekTitleView.heightAnchor.constraint(equalToConstant: 37),
            
            weekTitleLabel.centerYAnchor.constraint(equalTo: weekTitleView.centerYAnchor),
            weekTitleLabel.leadingAnchor.constraint(equalTo: weekTitleView.leadingAnchor),
            
            calendarImage.centerYAnchor.constraint(equalTo: weekTitleView.centerYAnchor),
            calendarImage.trailingAnchor.constraint(equalTo: weekTitleView.trailingAnchor),
            calendarImage.heightAnchor.constraint(equalToConstant: 24),
            calendarImage.widthAnchor.constraint(equalToConstant: 24),
            
            scrollViewBorder.topAnchor.constraint(equalTo: calendarImage.bottomAnchor, constant: 44),
            scrollViewBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            scrollViewBorder.heightAnchor.constraint(equalToConstant: 294),
            scrollViewBorder.widthAnchor.constraint(equalToConstant: 6),
            
            scrollViewFill.topAnchor.constraint(equalTo: scrollViewBorder.topAnchor),
            scrollViewFill.centerXAnchor.constraint(equalTo: scrollViewBorder.centerXAnchor),
            scrollViewFill.heightAnchor.constraint(equalToConstant: 138),
            scrollViewFill.widthAnchor.constraint(equalToConstant: 6),
            
            tableView.topAnchor.constraint(equalTo: weekTitleView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: scrollViewBorder.leadingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 312),
            
            weatherConditionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherConditionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            weatherConditionView.heightAnchor.constraint(equalToConstant: 28),
            weatherConditionView.widthAnchor.constraint(equalToConstant: 148),
            
            sunImage.leadingAnchor.constraint(equalTo: weatherConditionView.leadingAnchor),
            sunImage.centerYAnchor.constraint(equalTo: weatherConditionView.centerYAnchor),
            sunImage.heightAnchor.constraint(equalToConstant: 24),
            sunImage.widthAnchor.constraint(equalToConstant: 24),
            
            weatherConditionLabel.trailingAnchor.constraint(equalTo: weatherConditionView.trailingAnchor),
            weatherConditionLabel.centerYAnchor.constraint(equalTo: weatherConditionView.centerYAnchor),
        ])
    }
    
    func setTargets() {
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc func backPressed() {
        dismiss(animated: true)
    }
}

//MARK: CollectionView extension
extension SecondWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! WeatherCustomCollectionViewCell
        let temp = hourlyWeather[indexPath.row]
        cell.configure(image: temp.image, tempText: temp.temp, hourText: temp.time, showBorder: (temp.temp == "24°C"))
        return cell
    }
}

//MARK: UITableView extension
extension SecondWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! WeatherCustomTableViewCell
        let temp = weeklyWeather[indexPath.row]
        cell.configure(image: temp.image, dateText: temp.time, tempText: temp.temp)
        cell.contentView.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
