//
//  Rover.swift
//
//  Created by Marcelo Sampaio on 3/19/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Rover: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kRoverMaxDateKey: String = "max_date"
  private let kRoverStatusKey: String = "status"
  private let kRoverMaxSolKey: String = "max_sol"
  private let kRoverNameKey: String = "name"
  private let kRoverInternalIdentifierKey: String = "id"
  private let kRoverLandingDateKey: String = "landing_date"
  private let kRoverCamerasKey: String = "cameras"
  private let kRoverTotalPhotosKey: String = "total_photos"
  private let kRoverLaunchDateKey: String = "launch_date"

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
    maxDate = json[kRoverMaxDateKey].string
    status = json[kRoverStatusKey].string
    maxSol = json[kRoverMaxSolKey].int
    name = json[kRoverNameKey].string
    internalIdentifier = json[kRoverInternalIdentifierKey].int
    landingDate = json[kRoverLandingDateKey].string
    if let items = json[kRoverCamerasKey].array { cameras = items.map { Cameras(json: $0) } }
    totalPhotos = json[kRoverTotalPhotosKey].int
    launchDate = json[kRoverLaunchDateKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = maxDate { dictionary[kRoverMaxDateKey] = value }
    if let value = status { dictionary[kRoverStatusKey] = value }
    if let value = maxSol { dictionary[kRoverMaxSolKey] = value }
    if let value = name { dictionary[kRoverNameKey] = value }
    if let value = internalIdentifier { dictionary[kRoverInternalIdentifierKey] = value }
    if let value = landingDate { dictionary[kRoverLandingDateKey] = value }
    if let value = cameras { dictionary[kRoverCamerasKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = totalPhotos { dictionary[kRoverTotalPhotosKey] = value }
    if let value = launchDate { dictionary[kRoverLaunchDateKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.maxDate = aDecoder.decodeObject(forKey: kRoverMaxDateKey) as? String
    self.status = aDecoder.decodeObject(forKey: kRoverStatusKey) as? String
    self.maxSol = aDecoder.decodeObject(forKey: kRoverMaxSolKey) as? Int
    self.name = aDecoder.decodeObject(forKey: kRoverNameKey) as? String
    self.internalIdentifier = aDecoder.decodeObject(forKey: kRoverInternalIdentifierKey) as? Int
    self.landingDate = aDecoder.decodeObject(forKey: kRoverLandingDateKey) as? String
    self.cameras = aDecoder.decodeObject(forKey: kRoverCamerasKey) as? [Cameras]
    self.totalPhotos = aDecoder.decodeObject(forKey: kRoverTotalPhotosKey) as? Int
    self.launchDate = aDecoder.decodeObject(forKey: kRoverLaunchDateKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(maxDate, forKey: kRoverMaxDateKey)
    aCoder.encode(status, forKey: kRoverStatusKey)
    aCoder.encode(maxSol, forKey: kRoverMaxSolKey)
    aCoder.encode(name, forKey: kRoverNameKey)
    aCoder.encode(internalIdentifier, forKey: kRoverInternalIdentifierKey)
    aCoder.encode(landingDate, forKey: kRoverLandingDateKey)
    aCoder.encode(cameras, forKey: kRoverCamerasKey)
    aCoder.encode(totalPhotos, forKey: kRoverTotalPhotosKey)
    aCoder.encode(launchDate, forKey: kRoverLaunchDateKey)
  }

}
