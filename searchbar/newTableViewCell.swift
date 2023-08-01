//
//  newTableViewCell.swift
//  searchbar
//
//  Created by Neosoft on 01/08/23.
//

import UIKit

class newTableViewCell: UITableViewCell {

    @IBOutlet weak var firstlabel: UILabel!
    
    @IBOutlet weak var secondlabel: UILabel!
    
    @IBOutlet weak var thirdlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
