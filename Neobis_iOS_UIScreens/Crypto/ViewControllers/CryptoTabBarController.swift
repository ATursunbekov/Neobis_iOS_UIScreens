//
//  CryptoTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 26/10/23.
//

import UIKit

class CryptoTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        tabBar.tintColor = UIColor(hex: "#F6543E")
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.4
        tabBar.backgroundColor = UIColor.white
    }
    
    private func setupTabs() {
        
        let home = createNav(image: UIImage(named: "crypto1"), vc: CryptoViewController())
        let screen1 = createNav(image: UIImage(named: "crypto2"), vc: SecondCryptoViewController())
        let screen2 = createNav(image: UIImage(named: "crypto3"), vc: ThirdCryptoViewController())
        self.setViewControllers([home, screen1, screen2], animated: true)
    }
    
    private func createNav(image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.image = image
        
        return nav
    }
}
