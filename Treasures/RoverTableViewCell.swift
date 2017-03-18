//
//  RoverTableViewCell.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/18/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class RoverTableViewCell: UITableViewCell {
    
    
    // MARK: - Outlet
    @IBOutlet var innerBackgroundView: UIView!
    @IBOutlet var roverName: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var photosQty: UILabel!
    @IBOutlet var camsQty: UILabel!
    @IBOutlet var solsQty: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
