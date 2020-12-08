//
//  HGImage.swift
//  HGCommens
//
//  Created by 小雨很美 on 2020/12/14.
//

import Foundation

public extension UIImage {
    class func color(_ color: UIColor) -> UIImage? {
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let contextRef = UIGraphicsGetCurrentContext() else {
            return nil
        }
        contextRef.setFillColor(color.cgColor)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
