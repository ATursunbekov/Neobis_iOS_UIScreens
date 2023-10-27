//
//  FinanceTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 26/10/23.
//

import UIKit

class FinanceTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        tabBar.tintColor = .black
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 0.4
        tabBar.backgroundColor = UIColor(hex: "#F2F2F2E5", alpha: 0.9)
    }
    
    private func setupTabs() {
        
        let main = createNav(title: "Главная", image: UIImage(named: "circle"), vc: FinanceViewController())
        let reports = createNav(title: "Отчёты", image: UIImage(named: "union"), vc: SecondFinanceViewController())
        let profile = createNav(title: "Профиль", image: UIImage(named: "person"), vc: ThirdFinanceViewController())
        
        self.setViewControllers([main, reports, profile], animated: true)
    }
    
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        // Set the image and its rendering mode to alwaysTemplate for normal state
        nav.tabBarItem.image = image?.withRenderingMode(.alwaysTemplate)
            
        // Set the selected image and its rendering mode to alwaysOriginal
        nav.tabBarItem.selectedImage = image?.withRenderingMode(.alwaysOriginal)
        return nav
    }
}
