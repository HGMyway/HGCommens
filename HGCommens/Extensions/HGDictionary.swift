//
//  HGDictionary.swift
//  HGCommens
//
//  Created by 小雨很美 on 2020/12/18.
//

import Foundation

public extension Dictionary {
    static func + (lhs: Dictionary, rhs: Dictionary) -> Dictionary {
        var returnValue = lhs
        rhs.forEach({ returnValue[$0.key] = $0.value })
        return returnValue
    }
}
