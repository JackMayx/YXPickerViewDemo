//
//  YXPickerListView.swift
//  RuFengVideoEditDemo
//
//  Created by godox on 2020/1/10.
//  Copyright © 2020 YX. All rights reserved.
//

import UIKit


protocol YXPickerListViewDelegate: class {
    
    func yxPickerListView(at pickListView: YXPickerListView, didselectModel: YXModel)
    
}

class YXPickerListView: UIView {
        
    public var cityDataArray: [YXModel]? {
        didSet{
            myTableView.reloadData()
        }
    }
    public weak var delegate: YXPickerListViewDelegate?
    
    private var selectIndexs: IndexPath?
    
    private lazy var myTableView: UITableView = {
        let tab = UITableView(frame: self.bounds)
        tab.delegate = self
        tab.dataSource = self
        tab.rowHeight = 40
        tab.showsVerticalScrollIndicator = false
        tab.showsHorizontalScrollIndicator = false
        tab.separatorStyle = .none
        tab.register(YXPickerListCell.self, forCellReuseIdentifier: "YXPickerListCell")
        return tab
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(myTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension YXPickerListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cells = tableView.dequeueReusableCell(withIdentifier: "YXPickerListCell") as! YXPickerListCell
        cells.model = cityDataArray?[indexPath.row].name ?? ""
        
        if selectIndexs == indexPath{
            cells.chooseImageView.frame = CGRect(x: 15, y: 12.5, width: 15, height: 15)
            cells.titleLabel.frame = CGRect(x: 35, y: 10, width: 200, height: 20)
        }else{
            cells.chooseImageView.frame = CGRect(x: -15, y: 12.5, width: 15, height: 15)
            cells.titleLabel.frame = CGRect(x: 20, y: 10, width: 200, height: 20)
        }
        cells.selectionStyle = .none
        return cells
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if selectIndexs == nil{
            selectIndexs = indexPath
            let cell = tableView.cellForRow(at: indexPath) as! YXPickerListCell
            UIView.animate(withDuration: 0.3) {
                cell.chooseImageView.frame = CGRect(x: 15, y: 12.5, width: 15, height: 15)
                cell.titleLabel.frame = CGRect(x: 35, y: 10, width: 200, height: 20)
            }
        }else{
            
            ///取消选中
            let celled = tableView.cellForRow(at: selectIndexs!) as? YXPickerListCell
            celled?.chooseImageView.frame = CGRect(x: -15, y: 12.5, width: 15, height: 15)
            celled?.titleLabel.frame = CGRect(x: 20, y: 10, width: 200, height: 20)
            selectIndexs = indexPath
            ///选中
            let cell = tableView.cellForRow(at: indexPath) as! YXPickerListCell
            UIView.animate(withDuration: 0.3) {
                cell.chooseImageView.frame = CGRect(x: 15, y: 12.5, width: 15, height: 15)
                cell.titleLabel.frame = CGRect(x: 35, y: 10, width: 200, height: 20)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            if self.delegate != nil{
                self.delegate?.yxPickerListView(at: self, didselectModel: (self.cityDataArray?[indexPath.row])!)
            }
        }
    }

    
}
