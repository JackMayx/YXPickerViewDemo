//
//  ViewController.swift
//  YXPickerViewDemo
//
//  Created by godox on 2020/1/13.
//  Copyright © 2020 RuFeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 200, width: self.view.yx.width, height: 100))
        titleLabel.font = UIFont .systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        titleLabel.text = "选择地址"
        self.view.addSubview(titleLabel)
        titleLabel.addTapAction {
            let chooseView = YXChooseView(frame: CGRect(x: 0, y: self.view.yx.height, width: self.view.yx.width, height: 400))
            var stringCity = ""
            chooseView.chooseCityName = { titleArray in
                titleArray.forEach { (item) in
                    stringCity = stringCity + item
                }
                print("stringCity：\(stringCity)")
                titleLabel.text = stringCity
            }
        }
    }


}

