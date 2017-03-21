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
    private var cache:NSCache<AnyObject, AnyObject>!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cache = NSCache()
        
        self.navigationItem.title = rover.name!
        
        // load photos
        loadPhotos()
        
        print("Photos TVC - view did load - rover.name: \(rover.name!)")
        
        
    }
    
    // MARK: - Application Data Source
    private func loadPhotos() {
        
        setActivityIndicator(show: true)
        self.cache.removeAllObjects()

        ServiceAPI.getPhotos(roverName: rover.name!.lowercased(), sol: "501", page: "1" , success: {
            (photos) -> Void in
            
            // get api results
            for photo in photos {
                self.photos.append(photo)
            }
    
            print("**** loaded \(self.photos.count) photos.")
            
            // reload table view
            if self.photos.count > 0 {
                self.tableView.reloadData()
            }
            self.setActivityIndicator(show: false)
            
        }) {
            (error) -> Void in
            print("***** ERROR: \(error)")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoTableViewCell

        let photo = photos[indexPath.row]
        
        //////////////// IMAGE BEGIN /////////////////////
        
        if (self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil){
            cell.photoView?.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
        }else{
            let imgSrc = photo.imgSrc
            
            let url = URL(string: imgSrc!)
            getDataFromUrl(url: url!) { (data, response, error)  in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async() { () -> Void in
                    cell.photoView?.image = UIImage(data: data)
                    self.cache.setObject((cell.imageView?.image!)!, forKey: (indexPath as NSIndexPath).row as AnyObject)
                }
            }
        }
        
        cell.layer.borderColor = UIColor.applicationDetailBorderBackgroundColor.cgColor
        cell.layer.borderWidth = 1.5
        
        //////////////// IMAGE END /////////////////////

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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

    // MARK: - Image Helper
    private func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    
    
}
