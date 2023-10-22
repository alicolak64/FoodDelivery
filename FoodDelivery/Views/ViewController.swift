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
    }

    override func loadView() {
        super.loadView()
        setupCustomTabBar()
    }

    func setupCustomTabBar() {
        let shape = CAShapeLayer()
        shape.lineWidth = 0
        if let strokeColor = UIColor(hex: "#FB6B10", alpha: 1.0)?.cgColor {
            shape.strokeColor = strokeColor
        }
        shape.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.backgroundColor = UIColor(hex: "#FFFFFF")
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 180
        if let tintColor = UIColor(hex: "#FB6B10", alpha: 1.0) {
            self.tabBar.tintColor = tintColor
        }
    }

    func addCustomTabItems() {
        let menuScreenViewController = UINavigationController(rootViewController: MenuScreenViewController())
        let offerScreenViewController = UINavigationController(rootViewController: OfferScreenViewController())
        let homeScreenViewController = UINavigationController(rootViewController: HomeScreenViewController())
        let profileScreenViewController = UINavigationController(rootViewController: ProfileScreenViewController())
        let moreScreenViewController = UINavigationController(rootViewController: MoreScreenViewController())

        menuScreenViewController.title = "Menu"
        offerScreenViewController.title = "Offers"
        homeScreenViewController.title = "Home"
        profileScreenViewController.title = "Profile"
        moreScreenViewController.title = "More"

        setViewControllers([menuScreenViewController, offerScreenViewController, homeScreenViewController, profileScreenViewController, moreScreenViewController], animated: true)

        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "square.grid.2x2.fill")
        items[1].image = UIImage(systemName: "bag.fill")
        items[2].image = UIImage(systemName: "house.fill")
        items[3].image = UIImage(systemName: "person.fill")
        items[4].image = UIImage(systemName: "ellipsis")
    }

}

extension UIColor {
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (pureString.hasPrefix("#")) {
            pureString.remove(at: pureString.startIndex)
        }
        if ((pureString.count) != 6) {
            return nil
        }
        let scanner = Scanner(string: pureString)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
                alpha: CGFloat(alpha)
            )
            return
        }
        return nil
    }
}



