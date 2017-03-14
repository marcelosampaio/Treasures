//
//  RoversTableViewController.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class RoversTableViewController: UITableViewController {
    
    // MARK: Properties
    private var source = [Rovers]()
    
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // load source
        loadSource()
        
    }


    // MARK: - Application Data Source
    private func loadSource() {
        
        self.source = [Rovers]()
        
        // load mars rovers
        ServiceAPI.getRovers(params: Array(), success: {
            (rovers) -> Void in
            
            // get api results
            for rover in rovers {
                print("----> name: \(rover.name!)")
                print("    -> status: \(rover.status!)")
                print("    -> max_sol: \(rover.maxSol!)")
                print("    -> max_date: \(rover.maxDate!)")
                print("    -> landingDate: \(rover.landingDate!)")
                
                // prepare data source
                self.source.append(rover)
            }
            
            // reload table view
            if self.source.count > 0 {
                self.tableView.reloadData()
            }
            
        }) {
            (error) -> Void in
            print(error)
        }
    }
    
    
    
    
    

    // MARK: - Table View Delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let rover = source[indexPath.row]
        
        cell.textLabel?.text = rover.name
        

        return cell
    }
    


}
