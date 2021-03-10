//
//  HGString.swift
//  Alamofire
//
//  Created by 小雨很美 on 2020/12/18.
//

import Foundation
public extension String {
    var base64Decoded: String? {
        return Data(base64Encoded: self).flatMap { String(data: $0, encoding: .utf8) }
    }
}
public extension String {
     func stringByAppendingPathComponent(_ aString: String) -> String {
        return (self as NSString).appendingPathComponent(aString)
    }

     func stringByAppendingPathExtension(_ aString: String) -> String? {
        return (self as NSString).appendingPathExtension(aString)
    }

     var stringByDeletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }

     var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
}
