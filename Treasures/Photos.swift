//
//  Photos.swift
//
//  Created by Marcelo Sampaio on 3/19/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Photos: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kPhotosEarthDateKey: String = "earth_date"
  private let kPhotosCameraKey: String = "camera"
  private let kPhotosImgSrcKey: String = "img_src"
  private let kPhotosRoverKey: String = "rover"
  private let kPhotosInternalIdentifierKey: String = "id"
  private let kPhotosSolKey: String = "sol"

  // MARK: Properties
  public var earthDate: String?
  public var camera: Camera?
  public var imgSrc: String?
  public var rover: Rover?
  public var internalIdentifier: Int?
  public var sol: Int?

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
    earthDate = json[kPhotosEarthDateKey].string
    camera = Camera(json: json[kPhotosCameraKey])
    imgSrc = json[kPhotosImgSrcKey].string
    rover = Rover(json: json[kPhotosRoverKey])
    internalIdentifier = json[kPhotosInternalIdentifierKey].int
    sol = json[kPhotosSolKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = earthDate { dictionary[kPhotosEarthDateKey] = value }
    if let value = camera { dictionary[kPhotosCameraKey] = value.dictionaryRepresentation() }
    if let value = imgSrc { dictionary[kPhotosImgSrcKey] = value }
    if let value = rover { dictionary[kPhotosRoverKey] = value.dictionaryRepresentation() }
    if let value = internalIdentifier { dictionary[kPhotosInternalIdentifierKey] = value }
    if let value = sol { dictionary[kPhotosSolKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.earthDate = aDecoder.decodeObject(forKey: kPhotosEarthDateKey) as? String
    self.camera = aDecoder.decodeObject(forKey: kPhotosCameraKey) as? Camera
    self.imgSrc = aDecoder.decodeObject(forKey: kPhotosImgSrcKey) as? String
    self.rover = aDecoder.decodeObject(forKey: kPhotosRoverKey) as? Rover
    self.internalIdentifier = aDecoder.decodeObject(forKey: kPhotosInternalIdentifierKey) as? Int
    self.sol = aDecoder.decodeObject(forKey: kPhotosSolKey) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(earthDate, forKey: kPhotosEarthDateKey)
    aCoder.encode(camera, forKey: kPhotosCameraKey)
    aCoder.encode(imgSrc, forKey: kPhotosImgSrcKey)
    aCoder.encode(rover, forKey: kPhotosRoverKey)
    aCoder.encode(internalIdentifier, forKey: kPhotosInternalIdentifierKey)
    aCoder.encode(sol, forKey: kPhotosSolKey)
  }

}
