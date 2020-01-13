//
//  YXCompatible.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2019/12/26.
//  Copyright © 2019 MYX. All rights reserved.
//

import Foundation
public protocol YXCompatible {}

public struct YX<Base>{
    
    let base: Base
    init(_ base:Base) {
        self.base = base
    }
}


public extension YXCompatible{
    ///实力以及属性方法前缀
    var yx:YX<Self>{
        get { return YX<Self>(self) }
        set { }
    }
    ///类方法前缀
    static var yx: YX<Self>.Type{
        
        get { return YX<Self>.self }
        set { }
        
    }
    
}
