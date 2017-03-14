//
//  Rovers.swift
//
//  Created by Marcelo Sampaio on 3/13/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Rovers: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kRoversMaxDateKey: String = "max_date"
  private let kRoversStatusKey: String = "status"
  private let kRoversMaxSolKey: String = "max_sol"
  private let kRoversNameKey: String = "name"
  private let kRoversInternalIdentifierKey: String = "id"
  private let kRoversLandingDateKey: String = "landing_date"
  private let kRoversCamerasKey: String = "cameras"
  private let kRoversTotalPhotosKey: String = "total_photos"
  private let kRoversLaunchDateKey: String = "launch_date"

  // MARK: Properties
  public var maxDate: String?
  public var status: String?
  public var maxSol: Int?
  public var name: String?
  public var internalIdentifier: Int?
  public var landingDate: String?
  public var cameras: [Cameras]?
  public var totalPhotos: Int?
  public var launchDate: String?

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
    maxDate = json[kRoversMaxDateKey].string
    status = json[kRoversStatusKey].string
    maxSol = json[kRoversMaxSolKey].int
    name = json[kRoversNameKey].string
    internalIdentifier = json[kRoversInternalIdentifierKey].int
    landingDate = json[kRoversLandingDateKey].string
    if let items = json[kRoversCamerasKey].array { cameras = items.map { Cameras(json: $0) } }
    totalPhotos = json[kRoversTotalPhotosKey].int
    launchDate = json[kRoversLaunchDateKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = maxDate { dictionary[kRoversMaxDateKey] = value }
    if let value = status { dictionary[kRoversStatusKey] = value }
    if let value = maxSol { dictionary[kRoversMaxSolKey] = value }
    if let value = name { dictionary[kRoversNameKey] = value }
    if let value = internalIdentifier { dictionary[kRoversInternalIdentifierKey] = value }
    if let value = landingDate { dictionary[kRoversLandingDateKey] = value }
    if let value = cameras { dictionary[kRoversCamerasKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = totalPhotos { dictionary[kRoversTotalPhotosKey] = value }
    if let value = launchDate { dictionary[kRoversLaunchDateKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.maxDate = aDecoder.decodeObject(forKey: kRoversMaxDateKey) as? String
    self.status = aDecoder.decodeObject(forKey: kRoversStatusKey) as? String
    self.maxSol = aDecoder.decodeObject(forKey: kRoversMaxSolKey) as? Int
    self.name = aDecoder.decodeObject(forKey: kRoversNameKey) as? String
    self.internalIdentifier = aDecoder.decodeObject(forKey: kRoversInternalIdentifierKey) as? Int
    self.landingDate = aDecoder.decodeObject(forKey: kRoversLandingDateKey) as? String
    self.cameras = aDecoder.decodeObject(forKey: kRoversCamerasKey) as? [Cameras]
    self.totalPhotos = aDecoder.decodeObject(forKey: kRoversTotalPhotosKey) as? Int
    self.launchDate = aDecoder.decodeObject(forKey: kRoversLaunchDateKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(maxDate, forKey: kRoversMaxDateKey)
    aCoder.encode(status, forKey: kRoversStatusKey)
    aCoder.encode(maxSol, forKey: kRoversMaxSolKey)
    aCoder.encode(name, forKey: kRoversNameKey)
    aCoder.encode(internalIdentifier, forKey: kRoversInternalIdentifierKey)
    aCoder.encode(landingDate, forKey: kRoversLandingDateKey)
    aCoder.encode(cameras, forKey: kRoversCamerasKey)
    aCoder.encode(totalPhotos, forKey: kRoversTotalPhotosKey)
    aCoder.encode(launchDate, forKey: kRoversLaunchDateKey)
  }

}
