//
//  PhotosTableViewController.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/19/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {

    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
