//
//  GeneralExtensions.swift
//  FoodDelivery
//
//  Created by Ali Çolak on 23.10.2023.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String, alpha: Double = 1.0) {
        var pureString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if pureString.hasPrefix("#") {
            pureString.remove(at: pureString.startIndex)
        }
        if pureString.count != 6 {
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

extension UIViewController {
    func showAlert(title: String, message: String, buttonTitle: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

