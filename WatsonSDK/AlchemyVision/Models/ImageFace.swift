//
//  ImageKeyWordsModel.swift
//  Alchemy
//
//  Created by Vincent Herrin on 9/30/15.
//  Copyright © 2015 MIL. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

/**
 *  ImageFace holds attribute information of height, width, positionX, positionY, age and gender
 - parameter fileURL: adsf asdf
 */
public struct ImageFace : Mappable {
  
    public var age         = [String: AnyObject]()
    public var gender      = [String: AnyObject]()
    public var height:     Int?
    public var positionX:  Int?
    public var positionY:  Int?
    public var width:      Int?
  
    // this will go away once objectmapper can handle pointers
    init(json: JSON) {
        
        height      = json["height"].intValue
        width       = json["width"].intValue
        positionX   = json["positionX"].intValue
        positionY   = json["positionY"].intValue
        
        for (key,subJson):(String, JSON) in json["age"] {
            age[key] = subJson.object
        }
        
        for (key,subJson):(String, JSON) in json["gender"] {
            gender[key] = subJson.object
        }
    }
    
    public init() {
        
    }
    
    public init?(_ map: Map) {}
    
    public mutating func mapping(map: Map) {
        height      <-  (map["height"], Transformation.stringToInt)
        width       <-  (map["width"], Transformation.stringToInt)
        positionX   <-   map["positionX"]
        positionY   <-   map["positionY"]
        age         <-   map["age"]
        gender      <-   map["gender"]
    }
}
