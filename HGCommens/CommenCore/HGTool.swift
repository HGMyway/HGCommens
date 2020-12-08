//
//  JDTool.swift
//  TouShi
//
//  Created by 小雨很美 on 2020/12/4.
//  Copyright © 2020 辉哥. All rights reserved.
//

import Foundation
public typealias HGGCDTask = (_ cancel: Bool) -> ()

open class HGTool {
    @discardableResult
    public static func gcdDelay(_ time: TimeInterval, task: @escaping () -> ()) -> HGGCDTask?{
        
        func dispatch_later(block: @escaping () -> ()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        
        var closure: (() -> Void)? = task
        var result: HGGCDTask?
        
        let delayedClosure: HGGCDTask = {
            cancel in
            if let closure = closure {
                if !cancel {
                    DispatchQueue.main.async(execute: closure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let result = result {
                result(false)
            }
        }
        
        return result
    }
    
    public static func gcdCancel(_ task: HGGCDTask?, cancel: Bool = true) {
        task?(cancel)
    }
    
}


