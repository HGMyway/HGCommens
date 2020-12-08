//
//  JDColor.swift
//  EGGTeacher
//
//  Created by 小雨很美 on 2020/12/4.
//  Copyright © 2020 鸡蛋. All rights reserved.
//

import UIKit

public extension UIColor {
    @objc convenience init(rgba: String) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0

        if rgba.hasPrefix("#") {
            var hexStr = (rgba as NSString).substring(from: 1) as NSString
            if hexStr.length == 8 {
                let alphaHexStr = hexStr.substring(from: 6)
                hexStr = hexStr.substring(to: 6) as NSString

                var alphaHexValue: UInt64 = 0
                let alphaScanner = Scanner(string: alphaHexStr)
                if alphaScanner.scanHexInt64(&alphaHexValue) {
                    let alphaHex = Int(alphaHexValue)
                    alpha = CGFloat(alphaHex & 0x000000FF) / 255.0
                }
            }

            let rgbScanner = Scanner(string: hexStr as String)
            var hexValue: UInt64 = 0
            if rgbScanner.scanHexInt64(&hexValue) {
                if hexStr.length == 6 {
                    let hex = Int(hexValue)
                    red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
                    blue = CGFloat(hex & 0x0000FF) / 255.0
                }
            }
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    /// 两种颜色前后叠加
    convenience init(front: UIColor, back: UIColor) {
        var redFront: CGFloat = 0.0, greenFront: CGFloat = 0.0, blueFront: CGFloat = 0.0, alphaFront: CGFloat = 0
        var redBack: CGFloat = 0.0, greenBack: CGFloat = 0.0, blueBack: CGFloat = 0.0, alphaBack: CGFloat = 0

        // 非RGB兼容的UIColor，直接返回默认值
        if front.getRed(&redFront, green: &greenFront, blue: &blueFront, alpha: &alphaFront) &&
            back.getRed(&redBack, green: &greenBack, blue: &blueBack, alpha: &alphaBack) {

            let alpha: CGFloat = 1 - (1 - alphaFront) * (1 - alphaBack)
            let red = (alphaFront * redFront + (1 - alphaFront) * redBack * alphaBack) / alpha
            let green = (alphaFront * greenFront + (1 - alphaFront) * greenBack * alphaBack) / alpha
            let blue = (alphaFront * blueFront + (1 - alphaFront) * blueBack * alphaBack) / alpha
            self.init(red: red, green: green, blue: blue, alpha: alpha)

        } else {
            self.init()
        }
    }

    /// 在原有透明度基础上再加上透明度
    func withCompositeAlpha(_ alpha: CGFloat) -> UIColor {
        var white: CGFloat = 0, oriAlpha: CGFloat = 0
        self.getWhite(&white, alpha: &oriAlpha)
        return self.withAlphaComponent(oriAlpha * alpha)
    }
}

public extension UIColor {
    convenience init(rgba: UInt, alpha: CGFloat = 1) {
        let red = CGFloat((rgba & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgba & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(rgba & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    var hexString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        if alpha < 1.0 {
            let rgba = UInt(red * 255) << 24 | UInt(green * 255) << 16 | UInt(blue * 255) << 8 | UInt(alpha * 255)
            return String(format: "#%08x", rgba).uppercased()
        } else {
            let rgb = Int(red * 255) << 16 | Int(green * 255) << 8 | Int(blue * 255) << 0
            return String(format: "#%06x", rgb).uppercased()
        }
    }
}
