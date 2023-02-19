//
//  TableViewCell.swift
//  ServerJson_02
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDept: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
