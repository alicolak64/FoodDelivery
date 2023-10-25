//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 22.10.2023.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomTabItems()
        self.selectedIndex = AppConstants.initialTab
    }
    
    override func loadView() {
        super.loadView()
        setupCustomTabBar()
    }
    
    func setupCustomTabBar() {
        let shape = CAShapeLayer()
        shape.lineWidth = 0
        if let strokeColor = AppColors.mainColor?.cgColor {
            shape.strokeColor = strokeColor
        }
        shape.fillColor = AppColors.whiteColor?.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.backgroundColor = AppColors.whiteColor
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 180
        if let tintColor = AppColors.mainColor {
            self.tabBar.tintColor = tintColor
        }
    }
    
    func addCustomTabItems() {
        let menuScreenViewController = UINavigationController(rootViewController: MenuScreenViewController())
        let offerScreenViewController = UINavigationController(rootViewController: OfferScreenViewController())
        let homeScreenViewController = UINavigationController(rootViewController: HomeScreenViewController())
        let profileScreenViewController = UINavigationController(rootViewController: ProfileScreenViewController())
        let moreScreenViewController = UINavigationController(rootViewController: MoreScreenViewController())
        
        menuScreenViewController.title = AppTabs.tab1.name
        offerScreenViewController.title = AppTabs.tab2.name
        homeScreenViewController.title = AppTabs.tab3.name
        profileScreenViewController.title = AppTabs.tab4.name
        moreScreenViewController.title = AppTabs.tab5.name
        
        setViewControllers([menuScreenViewController, offerScreenViewController, homeScreenViewController, profileScreenViewController, moreScreenViewController], animated: true)
        
        guard let items = tabBar.items else { return }
        items[0].image = AppTabs.tab1.icon
        items[1].image = AppTabs.tab2.icon
        items[2].image = AppTabs.tab3.icon
        items[3].image = AppTabs.tab4.icon
        items[4].image = AppTabs.tab5.icon
    }
    
    
    
}



