//
//  UIColor+Extension.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import UIKit

// MARK: - Custom colors
extension UIColor {
    static let lightGray = UIColor(hex: "#F6F8F9")
    static let lightBlue = UIColor(hex: "#A1B0C5")
    static let red = UIColor(hex: "#AD090C")
    static let green = UIColor(hex: "#57C651")
    static let yellow = UIColor(hex: "#FECC09")
    static let orange = UIColor(hex: "#FBAF2C")
    static let darkOrange = UIColor(hex: "#FA8735")
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
