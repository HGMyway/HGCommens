//
//  UIView+Constraints.swift
//  HGPhotos_swift
//
//  Created by 小雨很美 on 2020/11/18.
//  Copyright © 2020 小雨很美. All rights reserved.
//

import UIKit

public extension UIView {

    // MARK: Height & Width
    @discardableResult func constraintHeight(_ height: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 0.0,
            constant: height
        )
        superview?.addConstraint(heightConstraint)
        return heightConstraint
    }

    @discardableResult func constraintHeight(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: item,
            attribute: .height,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(heightConstraint)
        return heightConstraint
    }

    @discardableResult func constraintWidth(_ width: CGFloat) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 0.0,
            constant: width
        )
        superview?.addConstraint(widthConstraint)
        return widthConstraint
    }

    @discardableResult func constraintWidth(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: item,
            attribute: .width,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(widthConstraint)
        return widthConstraint
    }

    // MARK: Align

    /// 添加约束与 View 四周对齐，并保持内间距
    ///
    /// - Parameters:
    ///   - item: 与之四周对齐的 View
    ///   - inset: 距离 item 的四边内间距。正值为往内缩，负值为往外扩。
    func align(with item: Any, inset: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        alignTop(with: item, constant: inset.top)
        alignLeft(with: item, constant: inset.left)
        alignRight(with: item, constant: -inset.right)
        alignBottom(with: item, constant: -inset.bottom)
    }

    // MARK: Align Top

    @discardableResult func alignTop(with item: Any, constant: CGFloat = 0, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: item,
            attribute: .top,
            multiplier: multiplier,
            constant: constant
        )
        superview?.addConstraint(topConstraint)
        return topConstraint
    }

    @discardableResult func alignTopWithCenterY(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let topToCenterYConstraint = NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: item,
            attribute: .centerY,
            multiplier: 1.0,
            constant: constant)
        superview?.addConstraint(topToCenterYConstraint)
        return topToCenterYConstraint
    }

    @discardableResult func alignTopWithBottom(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let topToBottomConstraint = NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: item,
            attribute: .bottom,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(topToBottomConstraint)
        return topToBottomConstraint
    }

    // MARK: Align Bottom

    @discardableResult func alignBottom(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let bottomConstraint = NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: item,
            attribute: .bottom,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(bottomConstraint)
        return bottomConstraint
    }

    @discardableResult func alignBottomWithTop(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let bottomToTopConstraint = NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: item,
            attribute: .top,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(bottomToTopConstraint)
        return bottomToTopConstraint
    }

    // MARK: Align Right

    @discardableResult func alignRight(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let rightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .right,
            relatedBy: .equal,
            toItem: item,
            attribute: .right,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(rightConstraint)
        return rightConstraint
    }

    @discardableResult func alignRightWithCenterX(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let rightToCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .right,
            relatedBy: .equal,
            toItem: item,
            attribute: .centerX,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(rightToCenterConstraint)
        return rightToCenterConstraint
    }

    @discardableResult func alignRightWithLeft(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let rightToLeftConstraint = NSLayoutConstraint(
            item: self,
            attribute: .right,
            relatedBy: .equal,
            toItem: item,
            attribute: .left,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(rightToLeftConstraint)
        return rightToLeftConstraint
    }

    // MARK: Align Left

    @discardableResult func alignLeftWithCenterX(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let leftToCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .left,
            relatedBy: .equal,
            toItem: item,
            attribute: .centerX,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(leftToCenterConstraint)
        return leftToCenterConstraint
    }

    @discardableResult func alignLeft(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(
            item: self,
            attribute: .left,
            relatedBy: .equal,
            toItem: item,
            attribute: .left,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(leftConstraint)
        return leftConstraint
    }

    @discardableResult func alignLeftWithRight(of item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let leftToRightConstraint = NSLayoutConstraint(
            item: self,
            attribute: .left,
            relatedBy: .equal,
            toItem: item,
            attribute: .right,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(leftToRightConstraint)
        return leftToRightConstraint
    }

    // MARK: Align Center

    @discardableResult func alignCenterX(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: item,
            attribute: .centerX,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(centerXConstraint)
        return centerXConstraint
    }

    @discardableResult func alignCenterY(with item: Any, constant: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let centerYConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: item,
            attribute: .centerY,
            multiplier: 1.0,
            constant: constant
        )
        superview?.addConstraint(centerYConstraint)
        return centerYConstraint
    }
}
