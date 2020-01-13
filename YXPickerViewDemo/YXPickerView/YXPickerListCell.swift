//
//  YXPickerListCell.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2020/1/13.
//  Copyright © 2020 YX. All rights reserved.
//

import UIKit

class YXPickerListCell: UITableViewCell {

    public var chooseImage: UIImageView!
    public var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViewsMethod()


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public var model: String? {
        
        didSet{
            titleLabel.text = model
        }
    }
    
    private func addSubViewsMethod(){
        
        chooseImage = UIImageView(frame: CGRect(x: -15, y: 12.5, width: 15, height: 15))
        chooseImage.image = UIImage(named: "chooseCity")
        addSubview(chooseImage)
        
        titleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        titleLabel.textColor = UIColor.gray
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        addSubview(titleLabel)
        
    }
    
    
    
    
    
    
}
