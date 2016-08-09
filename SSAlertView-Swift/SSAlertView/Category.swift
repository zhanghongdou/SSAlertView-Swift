//
//  Category.swift
//  SSAlertView-Swift
//
//  Created by haohao on 16/8/8.
//  Copyright © 2016年 haohao. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //正确的时候的绘图
    func ss_drawCheckMark() {
        self.cleanAllSublayer()
        let bezierPath = UIBezierPath.init(arcCenter: CGPointMake(drawRectImageWith / 2, drawRectImageWith / 2), radius: drawRectImageWith / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.moveToPoint(CGPointMake(drawRectImageWith / 4, drawRectImageWith / 2))
        bezierPath.addLineToPoint(CGPointMake(drawRectImageWith / 4 + 10, drawRectImageWith / 2 + 10))
        bezierPath.addLineToPoint(CGPointMake(drawRectImageWith / 4 * 3, drawRectImageWith / 4))
        let shaperLabyer = CAShapeLayer()
        shaperLabyer.fillColor = UIColor.clearColor().CGColor
        shaperLabyer.strokeColor = SUCCESS_COLOR.CGColor
        shaperLabyer.lineWidth = 5
        shaperLabyer.path = bezierPath.CGPath
        self.layer.addSublayer(shaperLabyer)
    }
    //警告的时候的绘图
    func ss_drawWarning() {
        self.cleanAllSublayer()
        let bezierPath = UIBezierPath.init(arcCenter: CGPointMake(drawRectImageWith / 2, drawRectImageWith / 2), radius: drawRectImageWith / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.moveToPoint(CGPointMake(drawRectImageWith / 2, drawRectImageWith / 6))
        bezierPath.addLineToPoint(CGPointMake(drawRectImageWith / 2, drawRectImageWith / 6 * 3.8))
        bezierPath.moveToPoint(CGPointMake(drawRectImageWith / 2, drawRectImageWith / 6 * 4.5))
        bezierPath.addArcWithCenter(CGPointMake(drawRectImageWith / 2, drawRectImageWith / 6 * 4.5), radius: 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let shaperLayer = CAShapeLayer()
        shaperLayer.fillColor = UIColor.clearColor().CGColor
        shaperLayer.strokeColor = WARNING_COLOR.CGColor
        shaperLayer.lineWidth = 5
        shaperLayer.path = bezierPath.CGPath
        self.layer.addSublayer(shaperLayer)
    }
    //错误的时候的绘图
    func ss_drawError() {
        self.cleanAllSublayer()
        let bezierPath = UIBezierPath.init(arcCenter: CGPointMake(drawRectImageWith / 2, drawRectImageWith / 2), radius: drawRectImageWith / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        bezierPath.moveToPoint(CGPointMake(drawRectImageWith / 4, drawRectImageWith / 4))
        bezierPath.addLineToPoint(CGPointMake(drawRectImageWith / 4 * 3, drawRectImageWith / 4 * 3))
        bezierPath.moveToPoint(CGPointMake(drawRectImageWith / 4 * 3, drawRectImageWith / 4))
        bezierPath.addLineToPoint(CGPointMake(drawRectImageWith / 4, drawRectImageWith / 4 * 3))
        let shaperLayer = CAShapeLayer()
        shaperLayer.fillColor = UIColor.clearColor().CGColor
        shaperLayer.strokeColor = ERROR_COLOR.CGColor
        shaperLayer.lineWidth = 5
        shaperLayer.path = bezierPath.CGPath
        self.layer.addSublayer(shaperLayer)
    }
    //清楚View上面的subLayers
    func cleanAllSublayer() {
        if self.layer.sublayers?.count > 0 {
            for item in self.layer.sublayers! {
                item.removeFromSuperlayer()
            }
        }
        
    }
}