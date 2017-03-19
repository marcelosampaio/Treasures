//
//  RoversTableViewController.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class RoversTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    private var source = [Rovers]()
    
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // load source
        getRovers()
        
    }


    // MARK: - Application Data Source
    private func getRovers() {
        
        self.source = [Rovers]()
        
        setActivityIndicator(show: true)
        
        // load mars rovers
        ServiceAPI.getRovers(params: Array(), success: {
            (rovers) -> Void in
            
            // get api results
            for rover in rovers {
                print(" ----> name: \(rover.name!)")
                print("    -> status: \(rover.status!)")
                print("    -> max_sol: \(rover.maxSol!)")
                print("    -> max_date: \(rover.maxDate!)")
                print("    -> landingDate: \(rover.landingDate!)")
                print("    -> total photos: \(rover.totalPhotos!)")
                print("    -> cameras: \(rover.cameras!)")
                for item in rover.cameras! {
                    print("            > cameras: \(item.fullName)")
                }
                
                // prepare data source
                self.source.append(rover)
            }
            
            // reload table view
            if self.source.count > 0 {
                self.tableView.reloadData()
                self.setActivityIndicator(show: false)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RoverTableViewCell
        

        let rover = source[indexPath.row]
        
//        cell.textLabel?.text = rover.name
        cell.innerBackgroundView.backgroundColor = UIColor.applicationLightBackgroundColor
        cell.innerBackgroundView.layer.borderWidth = 2.00
        cell.innerBackgroundView.layer.borderColor = UIColor.applicationDetailBorderBackgroundColor.cgColor
        
        
        cell.roverName.text = rover.name
        cell.roverName.textColor = UIColor.black
        cell.status.text = rover.status
        cell.photosQty.text = String(describing: rover.totalPhotos!) + " Photos"
        cell.camsQty.text = String(describing: rover.cameras!.count) + " Cameras"
        cell.solsQty.text = String(describing: rover.maxSol!) + " Sols"
        
        if rover.status == "complete" {
            cell.status.textColor = UIColor.applicationInactiveStatusColor
        }else{
            cell.status.textColor = UIColor.applicationActiveStatusColor
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Activity Indicator
    private func setActivityIndicator(show: Bool) {
        
        self.activityIndicator.isHidden = !show
        if show {
            self.activityIndicator.startAnimating()
        }else{
            self.activityIndicator.stopAnimating()
        }
        
        
    }
    
    

}
