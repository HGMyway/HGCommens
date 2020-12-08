//
//  Folder.swift
//  HGCommens
//
//  Created by 小雨很美 on 2020/12/18.
//

import Foundation

protocol HGFolder {
    var name: String { get }
    var present: HGFolder { get }
    var path: String { get }
    var availablePath: String? { get }
}

extension HGFolder {
    var path: String {
        let path = present.path.stringByAppendingPathComponent(name)
        if !FileManager.default.fileExists(atPath: path) {
            try? FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        return path
    }
    
    public var availablePath: String? {
        guard let presentPath = present.availablePath else { return nil }
        let path = presentPath.stringByAppendingPathComponent(name)
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                return nil
            }
        }
        return path
    }
}

enum HGRootFolder: HGFolder {
    case root
    case general(directory: FileManager.SearchPathDirectory)
    case shared(groupID: String)
    
    var name: String {
        return path.lastPathComponent
    }
    
    var present: HGFolder {
        return HGRootFolder.root
    }
    
    var path: String {
        return availablePath ?? "/"
    }
    
    var availablePath: String? {
        let rootPath: String?
        switch self {
        case let .general(directory: directory):
            rootPath = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true).first
        case let .shared(groupID: groupID):
            rootPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)?.path
        case .root:
            rootPath = "/"
        }
        return rootPath
    }
}

extension HGRootFolder {
    static var document: HGFolder {
        return HGRootFolder.general(directory: .documentDirectory)
    }
    static var cache: HGFolder {
        return HGRootFolder.general(directory: .cachesDirectory)
    }
}

extension HGFolder where Self: RawRepresentable, Self.RawValue == String {
    var name: String {
        return rawValue
    }
}

public class HGFolderManager {
    class func folderSize(path: String) -> UInt64 {
        guard let filenames = try? FileManager.default.contentsOfDirectory(atPath: path) else {
            return 0
        }
        var sumSize: UInt64 = 0
        for filename in filenames {
            let subpath = path + "/" + filename
            
            if let atts = try? FileManager.default.attributesOfItem(atPath: subpath) {
                if let type = atts[.type] as? FileAttributeType, type == .typeDirectory {
                    sumSize += folderSize(path: subpath)
                } else if let size = atts[.size] as? UInt64 {
                    sumSize += size
                }
            }
        }
        return sumSize
    }
}
