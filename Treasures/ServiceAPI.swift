//
//  ServiceAPI.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/13/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ServiceAPI: NSObject {
    

    // MARK: - Rovers
    class func getRovers(params: Array<Any>, success:@escaping ([Rovers]) -> Void, failure:@escaping (Error) -> Void) {
        
        var url = getEndpoint(action: "getRovers", param: String())
        let apiKey = getEndpoint(action: "apiKey", param: String())
        url = url.replacingOccurrences(of: "[APIKEY]", with: apiKey)
        
        var resultArray = [Rovers]()
        
        
        Alamofire.request(url).responseJSON { (response) -> Void in
            if response.result.isSuccess {
                
                print("*** Success API call")
                
                if let result = response.data {
                    let jsonDic = JSON(data: result)
                    
                    let jsonValueDic = jsonDic.rawValue as! NSDictionary
                    let jsonArray = jsonValueDic.object(forKey: "rovers") as! NSArray

                    for item in jsonArray {
                        let rover = Rovers.init(object: item)
                        resultArray.append(rover)
                    }
                    
                }
                success(resultArray)
            }
            if response.result.isFailure {
                print("*** Failure API call")
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }

    
    // MARK: - Rover's Photos
    class func getPhotos(roverName: String, sol: String, page: String, success:@escaping ([Photos]) -> Void, failure:@escaping (Error) -> Void) {
        
        let configUrl = getEndpoint(action: "getRoverPhotosWithSol", param: String())
        let apiKey = getEndpoint(action: "apiKey", param: String())
        var url = configUrl.replacingOccurrences(of: "[ROVER]", with: roverName)
        url = url.replacingOccurrences(of: "[SOL]", with: sol)
        url = url.replacingOccurrences(of: "[PAGE]", with: page)
        url = url.replacingOccurrences(of: "[APIKEY]", with: apiKey)
        
        
        print("*** getPhotos url: \(url)")
        
        
        var resultArray = [Photos]()
        
        
        Alamofire.request(url).responseJSON { (response) -> Void in
            if response.result.isSuccess {
                
                print("*** Success getPhotos API call")
                
                if let result = response.data {
                    let jsonDic = JSON(data: result)
                    let jsonValueDic = jsonDic.rawValue as! NSDictionary
                    
                    if jsonValueDic["errors"] == nil {
                        print("*** ERROR 1 key NOT FOUND")
                        let jsonArray = jsonValueDic.object(forKey: "photos") as! NSArray
                        
                        for item in jsonArray {
                            let photo = Photos.init(object: item)
                            resultArray.append(photo)
                        }
                    }
                }
                success(resultArray)
            }
            if response.result.isFailure {
                print("*** Failure API call")
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
    
    
    
    
    
    // MARK: - Class Helper
    class func getEndpoint(action: String, param: String) -> String {
        
        var result = String()
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            
            // file root is a dictionary
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                print ("****** dic = \(dic)")
                
                result = dic[action] as! String
                
                if !(param == "") {
                    print("*** ACTION: \(action) PARAM: \(param)")
                    result = result.replacingOccurrences(of: "$", with: param)
                }
            }
        }
        print("***2*** ACTION: \(action) PARAM: \(param)")
        return result
    }

}
