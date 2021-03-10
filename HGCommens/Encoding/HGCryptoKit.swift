//
//  HGCryptoKit.swift
//  HGCommens
//
//  Created by 小雨很美 on 2020/12/18.
//

import Foundation
import CryptoKit
import CommonCrypto

public extension String {
    func MD5() -> String? {
        if #available(iOS 13.0, *) {
            return data(using: .utf8)?.md5
        } else {
            return data(using: .utf8)?.md5String
        }
    }
}

public extension Data {
    var md5String: String {
        let hash = withUnsafeBytes { (bytes) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
    @available(iOS 13.0, *)
    var md5: String {
        let digest = Insecure.MD5.hash(data: self)
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
