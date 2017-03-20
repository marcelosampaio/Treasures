//
//  PhotosTableViewController.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/19/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotosTableViewController: UITableViewController {

    // MARK: Properties
    var rover = Rovers.init(json: JSON.null)
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("Photos TVC - view did load - rover.name: \(rover.name!)")
        
        
    }


    // MARK: - Table View Delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
