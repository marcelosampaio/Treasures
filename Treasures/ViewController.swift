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
            (itemsArray) -> Void in
            
            // get api results
            print("> after api call   count: \(itemsArray.count)")
            
        }) {
            (error) -> Void in
            print(error)
        }

        
        
        
//        Alamofire.request(url, method: .get).responseJSON(completionHandler: {
//            response in
//            
//            if response.result.isSuccess {
//                
//                print("Response.data: \(response.data)")
//                
//                
//                
//            }else{
//                print("*** an error has occurred")
//
//            }
//            
//        })
        
        
        
        
    }

    
    
    
}

