//
//  Realm+Utilities.swift
//
//  Created by rfg-dev on 8/12/17.
//  Copyright © 2017 rfg-dev. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import SwiftyJSON

// MARK: - Some Object (from Realm) extensions
extension Object {
  /// Transfor a Realm Object to JSON (as SwiftyJSON object)
  ///
  /// - Returns: JSON object
  func toJSON() -> JSON {
    var json = JSON()
    for property in self.objectSchema.properties as [Property]! {
      if let nestedObject = self[property.name] as? Object {
        json[property.name] = nestedObject.toJSON()
      } else if let nestedListObject = self[property.name] as? ListBase {
        var objects = [JSON]()
        for index in 0..<nestedListObject._rlmArray.count {
          let object = nestedListObject._rlmArray[index] as! Object
          objects.append(object.toJSON())
        }
        json[property.name] = JSON(objects)
      } else {
        json[property.name] = JSON(self[property.name] as Any)
      }
    }
    
    return json
  }
}
