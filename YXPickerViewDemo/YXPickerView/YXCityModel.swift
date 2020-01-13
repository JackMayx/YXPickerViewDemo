//
//  YXCityModel.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2020/1/10.
//  Copyright © 2020 YX. All rights reserved.
//

import Foundation
import KakaJSON


/// 数据model
struct YXModel: Convertible {
    
    var id: String?
    
    var name: String?
    
    var child: [YXModel]?
    
}




