//
//  Helper.swift
//  Treasures
//
//  Created by Marcelo Sampaio on 3/19/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import Foundation

public class Helper {
    class func roverName(code: String) -> String {

        let roverDic = NSDictionary()
        roverDic.setValue("Front Hazard Avoidance Camera", forKey: "FHAZ")
        roverDic.setValue("Rear Hazard Avoidance Camera", forKey: "RHAZ")
        roverDic.setValue("Mast Camera", forKey: "MAST")
        roverDic.setValue("Chemistry and Camera Complex", forKey: "CHEMCAM")
        roverDic.setValue("Mars Hand Lens Imager", forKey: "MAHLI")
        roverDic.setValue("Mars Descent Imager", forKey: "MARDI")
        roverDic.setValue("Navigation Camera", forKey: "NAVCAM")
        roverDic.setValue("Panoramic Camera", forKey: "PANCAM")
        roverDic.setValue("Miniature Thermal Emission Spectrometer", forKey: "MINITES")

        return roverDic.object(forKey: code) as! String
    
    }
}

