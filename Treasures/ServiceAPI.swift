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
        
        let url = getEndpoint(action: "getRovers", param: String())
        
        
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





// Usage:
//
//ServiceAPI.getRovers(params: Array(), success: {
//    (rovers) -> Void in
//    
//    // get api results
//    for rover in rovers {
//        print("----> name: \(rover.name!)")
//        print("    -> status: \(rover.status!)")
//        print("    -> max_sol: \(rover.maxSol!)")
//        print("    -> max_date: \(rover.maxDate!)")
//        print("    -> landingDate: \(rover.landingDate!)")
//        //  landingDate
//    }
//    
//}) {
//    (error) -> Void in
//    print(error)
//}





