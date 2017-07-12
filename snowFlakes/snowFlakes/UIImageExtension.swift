//
//  UIImageExtension.swift
//  snowFlakes
//
//  Created by vara shen on 2017/7/12.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

extension UIImage {
    /// 将当前图片缩放到指定宽度
    ///
    /// - parameter width: 指定宽度
    ///
    /// - returns: UIImage，如果本身比指定的宽度小，直接返回
    func scaleImageToWidth(_ width: CGFloat) -> UIImage {
        
        //判断宽度，如果小于指定宽度直接返回当前图像
        if size.width < width {
            return self
        }
        
        //计算比例缩放的高度
        let height = width * size.height / size.width
        
        //图像的上下文
        let s = CGSize(width: width, height: height)
        
        // 提示：一旦开启上下文，所有的绘图都在当前上下文中
        UIGraphicsBeginImageContext(s)
        
        // 在制定区域中缩放绘制完整图像
        draw(in: CGRect(origin: CGPoint.zero, size: s))
        
        // 获取绘制结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        // 返回结果
        return result!
    }
}
