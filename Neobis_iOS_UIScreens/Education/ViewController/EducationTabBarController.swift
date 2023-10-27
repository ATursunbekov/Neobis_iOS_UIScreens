//
//  TravelTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Alikhan Tursunbekov on 27/10/23.
//

import UIKit

class EducationTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .black
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 0.4
        tabBar.backgroundColor = UIColor(hex: "#F2F2F2E5", alpha: 0.9)
        setupTabs()
    }
    
    private func setupTabs() {
        let main = createNav(title: "Series", image: UIImage(named: "data"), vc: EducationViewController())
        let reports = createNav(title: "Headspace", image: UIImage(named: "headphone"), vc: SecondFinanceViewController())
        let profile = createNav(title: "Profile", image: UIImage(named: "person"), vc: ThirdFinanceViewController())
        self.setViewControllers([main, reports, profile], animated: true)
    }
    
    private func createNav(title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
}
