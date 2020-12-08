//
//  HGVerify.swift
//  HGCommens
//
//  Created by 小雨很美 on 2020/12/18.
//

import Foundation

public extension String {
    func isPurnInt() -> Bool {
        let scan = Scanner(string: self)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    func isValidateMobile() -> Bool {
        let phoneRegex: String = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
}
