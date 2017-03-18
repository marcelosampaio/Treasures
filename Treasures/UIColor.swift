//
//  UIColor.swift
//  FlyToFoursquare
//
//  Created by Marcelo Sampaio on 12/15/16.
//  Copyright © 2016 Marcelo Sampaio. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    public class var applicationLightBackgroundColor: UIColor
    {
        return UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
    }
    
    public class var applicationDarkBackgroundColor: UIColor
    {
        return UIColor.darkGray
    }
    
    public class var applicationDetailBackgroundColor: UIColor
    {
        return UIColor.white
    }
    
    public class var applicationDetailBorderBackgroundColor: UIColor
    {
        return UIColor.black
    }
    
    public class var applicationInactiveStatusColor: UIColor
    {
        return UIColor(red: 128.00/255.00, green: 0.00, blue: 0.00, alpha: 1)
    }
    
    public class var applicationActiveStatusColor: UIColor
    {
        return UIColor(red: 64.00/255.00, green: 128.00/255.00, blue: 0.00, alpha: 1)
    }
    
    
}
