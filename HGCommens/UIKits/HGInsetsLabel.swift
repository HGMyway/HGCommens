//
//  HGInsetsLabel.swift
//  TouShi
//
//  Created by 小雨很美 on 2020/12/10.
//  Copyright © 2020 美院帮. All rights reserved.
//

import UIKit

open class HGInsetsLabel: UILabel {
    open var insets = UIEdgeInsets.zero

    open override func drawText(in rect: CGRect) {
        return super.drawText(in: rect.inset(by: insets))
    }
    open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        rect.size.width = rect.size.width + (insets.left + insets.right)
        rect.size.height = rect.size.height + (insets.top + insets.bottom)
        return rect
    }
}
