//
//  YXPickerTitleCell.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2020/1/10.
//  Copyright © 2020 YX. All rights reserved.
//

import UIKit

class YXPickerTitleCell: UICollectionViewCell {
    
    
    public var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setSubviews(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: yx.width, height: yx.height))
        titleLabel.font = UIFont .systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
    }

    override func layoutSubviews() {
        titleLabel.frame = CGRect(x: 0, y: 0, width: yx.width, height: yx.height)
        
        
        
        
    }
    
}
