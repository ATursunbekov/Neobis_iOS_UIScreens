//
//  MainViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 27/10/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var screen1: UIButton = {
        let button = UIButton()
        button.setTitle("Weather", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()
    
    private lazy var screen2: UIButton = {
        let button = UIButton()
        button.setTitle("Crypto", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()
    
    private lazy var screen3: UIButton = {
        let button = UIButton()
        button.setTitle("Finance", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()
    
    private lazy var screen4: UIButton = {
        let button = UIButton()
        button.setTitle("Travel", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()
    
    private lazy var screen5: UIButton = {
        let button = UIButton()
        button.setTitle("Education", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        setupTarger()
    }
    
    private func setupConstraints() {
        view.addSubview(screen1)
        view.addSubview(screen2)
        view.addSubview(screen3)
        view.addSubview(screen4)
        view.addSubview(screen5)
        
        [screen1, screen2, screen3, screen4, screen5].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            screen1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screen1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            screen2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screen2.topAnchor.constraint(equalTo: screen1.topAnchor, constant: 50),
            
            screen3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screen3.topAnchor.constraint(equalTo: screen2.topAnchor, constant: 50),
            
            screen4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screen4.topAnchor.constraint(equalTo: screen3.topAnchor, constant: 50),
            
            screen5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screen5.topAnchor.constraint(equalTo: screen4.topAnchor, constant: 50),
        ])
    }
    
    private func setupTarger(){
        screen1.addTarget(self, action: #selector(action1), for: .touchUpInside)
        screen2.addTarget(self, action: #selector(action2), for: .touchUpInside)
        screen3.addTarget(self, action: #selector(action3), for: .touchUpInside)
        screen4.addTarget(self, action: #selector(action4), for: .touchUpInside)
        screen5.addTarget(self, action: #selector(action5), for: .touchUpInside)
    }
    
    @objc func action1() {
        let secondViewController = FirstWeatherViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
    @objc func action2() {
        let secondViewController = CryptoTabBarController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
    @objc func action3() {
        let secondViewController = FinanceTabBarController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
    @objc func action4() {
        let secondViewController = TravelViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
    @objc func action5() {
        let secondViewController = EducationViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)
    }
}
