//
//  UIView-Extension.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2019/12/26.
//  Copyright © 2019 YX. All rights reserved.
//

import Foundation
import UIKit
extension UIView: YXCompatible{}

extension YX where Base: UIView{
    
    /// 宽度
    var width: CGFloat{
        
        get { base.frame.size.width }
        set { base.frame.size.width = newValue }
    }
    
    /// 高度
    var height: CGFloat{
        get { base.frame.size.height }
        set { base.frame.size.height = newValue}
        
    }
    
    /// size
    var size: CGSize{
        get { base.frame.size }
        set {}
    }
    ///bounds
    var bounds: CGRect{
        get { base.bounds }
        set {}
    }
    
    
    var y: CGFloat{
        get { base.frame.origin.y }
        set {}
    }
    var x: CGFloat{
        get { base.frame.origin.x }
        set {}
    }
    
    var center: CGPoint{
        get { base.center }
        set {}
    }
    
    var getWindow: UIWindow? {
        return UIApplication.shared.windows.reversed().first(where: {
            $0.screen == UIScreen.main &&
                !$0.isHidden && $0.alpha > 0 &&
                $0.windowLevel == UIWindow.Level.normal
        })
    }
    
    ///移除所有子view
    func removeAllSubviews(){
        let views = base.subviews
        for  i in views {
            i.removeFromSuperview()
        }
    }
    
    
    /// 裁剪圆角
    /// - Parameters:
    ///   - direction: 裁剪的上下左右的边角设置
    ///   - cornerRadius: 圆弧数值
    func clipRectCorner(direction: UIRectCorner, cornerRadius: CGFloat) {
        let cornerSize = CGSize(width:cornerRadius, height:cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        base.layer.addSublayer(maskLayer)
        base.layer.mask = maskLayer
    }
}


extension UIView{
    
    
    /// 添加点击事件
    /// - Parameter action: 点击
    func addTapAction(action: (() -> Void)?) {
        tapAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleTap)
        let recognizer = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
    
    typealias Action = (() -> Void)
    
    struct Key { static var id = "tapAction" }
    
    var tapAction: Action? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? Action
        }
        set {
            guard let value = newValue else { return }
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            objc_setAssociatedObject(self, &Key.id, value, policy)
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        tapAction?()
    }
    
}
