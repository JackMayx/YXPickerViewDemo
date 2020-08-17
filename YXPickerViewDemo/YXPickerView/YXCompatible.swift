//
//  YXCompatible.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2019/12/26.
//  Copyright © 2019 JackMayx. All rights reserved.
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
    
    var yx:YX<Self>{
        get { return YX<Self>(self) }
        set { }
    }
    
    static var yx: YX<Self>.Type{
        get { return YX<Self>.self }
        set { }
        
    }
    
}
