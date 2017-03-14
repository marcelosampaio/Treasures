//
//  Cameras.swift
//
//  Created by Marcelo Sampaio on 3/13/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Cameras: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCamerasNameKey: String = "name"
  private let kCamerasFullNameKey: String = "full_name"

  // MARK: Properties
  public var name: String?
  public var fullName: String?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    name = json[kCamerasNameKey].string
    fullName = json[kCamerasFullNameKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kCamerasNameKey] = value }
    if let value = fullName { dictionary[kCamerasFullNameKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: kCamerasNameKey) as? String
    self.fullName = aDecoder.decodeObject(forKey: kCamerasFullNameKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: kCamerasNameKey)
    aCoder.encode(fullName, forKey: kCamerasFullNameKey)
  }

}
