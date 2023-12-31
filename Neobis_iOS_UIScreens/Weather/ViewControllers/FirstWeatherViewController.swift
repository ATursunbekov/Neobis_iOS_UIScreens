//
//  ViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 21/10/23.
//

import UIKit

class FirstWeatherViewController: UIViewController {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    private lazy var contentViewGradient = CAGradientLayer()

    private lazy var decoreLineImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "line1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var decoreLineImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "line2")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.text = "Бишкек"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.textColor = .white
        label.addRegularShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowDown: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowDown")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var notificationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "notification")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sunImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.3)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: -3, height: 5)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня, 26 Апрель"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = .white
        label.addRegularShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22°"
        label.font = UIFont(name: "Overpass-Regular", size: 100)
        label.textColor = .white
        label.addTextShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.textColor = .white
        label.addRegularShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherConditionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var windImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wind")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var rainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rain")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветер |  15 km/h"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = .white
        label.addRegularShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rainLabel: UILabel = {
        let label = UILabel()
        label.text = "Дождь | 26 %"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.textColor = .white
        label.addRegularShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonLable:UILabel = {
        let label = UILabel()
        label.text = "Прогноз на неделю"
        label.font = UIFont(name: "Overpass-Regular", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.up")
        image.contentMode = .scaleAspectFill
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupGradient()
    }
    
    private func setupGradient() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0 / 255, green: 190 / 255, blue: 229 / 255, alpha: 1).cgColor, UIColor(red: 23 / 255, green: 154 / 255, blue: 250 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        contentViewGradient.frame = contentView.bounds
        contentViewGradient.colors = [UIColor(hex: "#FFFFFFB2", alpha: 0.7), UIColor(hex: "#BFBFBFB2", alpha: 0.7)]
        contentViewGradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        //gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupConstraints() {
        view.addSubview(decoreLineImage1)
        view.addSubview(decoreLineImage2)
        view.addSubview(cityView)
        cityView.addSubview(locationImage)
        cityView.addSubview(cityName)
        cityView.addSubview(arrowDown)
        view.addSubview(notificationImage)
        view.addSubview(sunImage)
        view.addSubview(contentView)
        view.addSubview(weatherButton)
        //contentView
        contentView.addSubview(dateLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(weatherConditionView)
        weatherConditionView.addSubview(windImage)
        weatherConditionView.addSubview(rainImage)
        weatherConditionView.addSubview(windLabel)
        weatherConditionView.addSubview(rainLabel)
        //weatherButtton
        weatherButton.addSubview(buttonLable)
        weatherButton.addSubview(arrowTop)
        
        NSLayoutConstraint.activate([
            decoreLineImage1.topAnchor.constraint(equalTo: view.topAnchor, constant: dynamicWidth(92)),
            decoreLineImage1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dynamicWidth(-25)),
            decoreLineImage1.heightAnchor.constraint(equalToConstant: dynamicWidth(235)),
            decoreLineImage1.widthAnchor.constraint(equalToConstant: dynamicWidth(112)),
            
            decoreLineImage2.topAnchor.constraint(equalTo: view.topAnchor, constant: dynamicWidth(-54)),
            decoreLineImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: dynamicWidth(70)),
            decoreLineImage2.heightAnchor.constraint(equalToConstant: dynamicWidth(366)),
            decoreLineImage2.widthAnchor.constraint(equalToConstant: dynamicWidth(425)),
            
            cityView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            cityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            cityView.heightAnchor.constraint(equalToConstant: 52),
            cityView.widthAnchor.constraint(equalToConstant: 197),
            
            locationImage.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            locationImage.leadingAnchor.constraint(equalTo: cityView.leadingAnchor),
            locationImage.heightAnchor.constraint(equalToConstant: 24),
            locationImage.widthAnchor.constraint(equalToConstant: 24),
            
            cityName.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            cityName.centerXAnchor.constraint(equalTo: cityView.centerXAnchor),
            
            arrowDown.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            arrowDown.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            arrowDown.heightAnchor.constraint(equalToConstant: 9),
            arrowDown.widthAnchor.constraint(equalToConstant: 6),
            
            notificationImage.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            notificationImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            notificationImage.heightAnchor.constraint(equalToConstant: 24),
            notificationImage.widthAnchor.constraint(equalToConstant: 26),
            
            sunImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            sunImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunImage.widthAnchor.constraint(equalToConstant: dynamicWidth(300)),
            sunImage.heightAnchor.constraint(equalToConstant: dynamicHeight(300)),
            
            contentView.topAnchor.constraint(equalTo: sunImage.bottomAnchor, constant: -30),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 353),
            contentView.heightAnchor.constraint(equalToConstant: 353),
            
            weatherButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            weatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherButton.widthAnchor.constraint(equalToConstant: 249),
            weatherButton.heightAnchor.constraint(equalToConstant: 64),
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            temperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 18),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            weatherConditionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -26),
            weatherConditionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherConditionView.widthAnchor.constraint(equalToConstant: 200),
            weatherConditionView.heightAnchor.constraint(equalToConstant: 72),
            
            windImage.topAnchor.constraint(equalTo: weatherConditionView.topAnchor, constant: 2),
            windImage.leadingAnchor.constraint(equalTo: weatherConditionView.leadingAnchor,constant: 2),
            windImage.widthAnchor.constraint(equalToConstant: 20),
            windImage.heightAnchor.constraint(equalToConstant: 20),
            
            rainImage.bottomAnchor.constraint(equalTo: weatherConditionView.bottomAnchor, constant: 2),
            rainImage.leadingAnchor.constraint(equalTo: weatherConditionView.leadingAnchor,constant: 2),
            rainImage.widthAnchor.constraint(equalToConstant: 20),
            rainImage.heightAnchor.constraint(equalToConstant: 20),
            
            windLabel.topAnchor.constraint(equalTo: weatherConditionView.topAnchor, constant: 2),
            windLabel.leadingAnchor.constraint(equalTo: windImage.trailingAnchor, constant: 20),
            
            rainLabel.bottomAnchor.constraint(equalTo: weatherConditionView.bottomAnchor, constant: 2),
            rainLabel.leadingAnchor.constraint(equalTo: rainImage.trailingAnchor, constant: 20),
            
            buttonLable.centerYAnchor.constraint(equalTo: weatherButton.centerYAnchor),
            buttonLable.leadingAnchor.constraint(equalTo: weatherButton.leadingAnchor, constant: 28),
            
            arrowTop.centerYAnchor.constraint(equalTo: weatherButton.centerYAnchor),
            arrowTop.trailingAnchor.constraint(equalTo: weatherButton.trailingAnchor, constant: -23),
            
        ])
        //addign Targets
        weatherButton.addTarget(self, action: #selector(weatherButtonPressed), for: .touchUpInside)
    }
    
    @objc func weatherButtonPressed() {
        let vc = SecondWeatherViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func dynamicHeight(_ height: Double) -> Double{
        return UIScreen.main.bounds.height * height / 896.0
    }
    
    func dynamicWidth(_ width: Double) -> Double{
        return UIScreen.main.bounds.width * width / 414.0
    }
}

