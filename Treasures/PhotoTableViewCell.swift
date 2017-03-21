//
//  PhotoTableViewCell.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/21/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    
    // MARK: - Outlets
    @IBOutlet var photoView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
