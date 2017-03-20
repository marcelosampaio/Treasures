//
//  Camera.swift
//
//  Created by Marcelo Sampaio on 3/19/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Camera: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCameraNameKey: String = "name"
  private let kCameraInternalIdentifierKey: String = "id"
  private let kCameraRoverIdKey: String = "rover_id"
  private let kCameraFullNameKey: String = "full_name"

  // MARK: Properties
  public var name: String?
  public var internalIdentifier: Int?
  public var roverId: Int?
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
    name = json[kCameraNameKey].string
    internalIdentifier = json[kCameraInternalIdentifierKey].int
    roverId = json[kCameraRoverIdKey].int
    fullName = json[kCameraFullNameKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kCameraNameKey] = value }
    if let value = internalIdentifier { dictionary[kCameraInternalIdentifierKey] = value }
    if let value = roverId { dictionary[kCameraRoverIdKey] = value }
    if let value = fullName { dictionary[kCameraFullNameKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: kCameraNameKey) as? String
    self.internalIdentifier = aDecoder.decodeObject(forKey: kCameraInternalIdentifierKey) as? Int
    self.roverId = aDecoder.decodeObject(forKey: kCameraRoverIdKey) as? Int
    self.fullName = aDecoder.decodeObject(forKey: kCameraFullNameKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: kCameraNameKey)
    aCoder.encode(internalIdentifier, forKey: kCameraInternalIdentifierKey)
    aCoder.encode(roverId, forKey: kCameraRoverIdKey)
    aCoder.encode(fullName, forKey: kCameraFullNameKey)
  }

}
