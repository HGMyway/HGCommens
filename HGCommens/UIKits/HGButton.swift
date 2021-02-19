//
//  HGButton.swift
//  HGCommens
//
//  Created by 小雨很美 on 2021/1/27.
//

import UIKit

open class HGButton: UIButton {
    
    public enum HGImagePosition : Int {
        case left
        case right
        case bottom
        case top
    }
    
    public var imagePosition: HGImagePosition = .left
    
    public convenience init(type buttonType: UIButton.ButtonType, imagePosition: HGButton.HGImagePosition = .left) {
        self.init(type: buttonType)
        self.imagePosition = imagePosition
    }
    
    open override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        
        var titleRect = super.titleRect(forContentRect: contentRect)
        guard imagePosition != .left, currentImage != nil else {
            return titleRect
        }
        let imageRect = super.imageRect(forContentRect: contentRect)
        
        switch imagePosition {
        case .right:
            titleRect = CGRect(origin: CGPoint(x: imageRect.origin.x, y: titleRect.origin.y), size: titleRect.size)
        case .top:
            titleRect = CGRect(x: (contentRect.width - titleRect.width) / 2, y: (contentRect.height - titleRect.height + imageRect.height + 4) / 2, width: titleRect.width, height: titleRect.height)
        case .bottom:
            titleRect = CGRect(origin: CGPoint(x: (contentRect.width - titleRect.width) / 2, y: (contentRect.height - (titleRect.height + imageRect.height + 4)) / 2), size: titleRect.size)
        case .left:
            break
        }
        return titleRect
    }
   
    open override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        var imageRect = super.imageRect(forContentRect: contentRect)
        guard imagePosition != .left, currentImage != nil else {
            return imageRect
        }
        let titleRect = super.titleRect(forContentRect: contentRect)
        
        switch imagePosition {
        case .right:
            imageRect = CGRect(origin: CGPoint(x: titleRect.maxX - imageRect.width, y: imageRect.origin.y), size: imageRect.size)
        case .top:
            imageRect = CGRect(origin: CGPoint(x: (contentRect.width - imageRect.width) / 2, y: (contentRect.height - (titleRect.height + imageRect.height + 4)) / 4), size: imageRect.size)
        case .bottom:
            imageRect = CGRect(origin: CGPoint(x: (contentRect.width - imageRect.width) / 2, y: (contentRect.height - imageRect.height  + titleRect.height + 4) / 2), size: imageRect.size)
        case .left:
            break
        }
        return imageRect
    }
}

