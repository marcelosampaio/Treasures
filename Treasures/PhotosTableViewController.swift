//
//  PhotosTableViewController.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/19/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage

class PhotosTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: Properties
    public var rover = Rovers.init(json: JSON.null)
    private var photos = [Photos]()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = rover.name!
        
        // load photos
        loadPhotos()
        
        print("Photos TVC - view did load - rover.name: \(rover.name!)")
        
        
    }
    
    // MARK: - Application Data Source
    private func loadPhotos() {
        
        setActivityIndicator(show: true)
        


        ServiceAPI.getPhotos(roverName: rover.name!.lowercased(), sol: "1000", page: "2" , success: {
            (photos) -> Void in
            
            // get api results
            for photo in photos {
                self.photos.append(photo)
                print("-- photo.rover: \(photo.rover?.name)  -- photo imgSrc: \(photo.imgSrc)")
            }
    
            // reload table view
            if self.photos.count > 0 {
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
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let photo = photos[indexPath.row]
        
        cell.textLabel?.text = photo.imgSrc
        

        
        return cell
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
