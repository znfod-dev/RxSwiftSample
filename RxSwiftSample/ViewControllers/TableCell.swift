//
//  TableCell.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/20.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var capitalLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func setData(model:Model) {
        self.nameLabel.text = model.name
        self.capitalLabel.text = model.capital
        self.countLabel.text = String(model.count)
    }
    
}
