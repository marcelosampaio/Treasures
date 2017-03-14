//
//  ViewController.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/12/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ////////////////
        
        ServiceAPI.getRovers(params: Array(), success: {
            (rovers) -> Void in
            
            // get api results
            for rover in rovers {
                
                print("----> name: \(rover.name!)")
                
            }
            
        }) {
            (error) -> Void in
            print(error)
        }


    }

    
    
    
}

