//
//  HotelTableViewCell.swift
//  purwakartaku
//
//  Created by oratakashi on 15/06/21.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var tvAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
