//
//  TableViewCell.swift
//  ServerJsonImageMovieList
//
//  Created by Anna Kim on 2022/12/31.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var jsonImage: UIImageView!
    @IBOutlet weak var jsonTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
