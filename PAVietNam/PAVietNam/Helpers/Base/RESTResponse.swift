//
//  RESTModel.swift
//  Treatsure
//
//  Created by Vinh on 4/27/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

class RESTResponse: Mappable {
    
    //error status
    @objc dynamic var statusCode = 0
    
    //error message
    @objc dynamic var message = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.message      <- map["message"]
        
        if map.JSON["status"] != nil {
            self.statusCode <- map["status"]
        } else {
            self.statusCode <- map["code"]
        }
    }
    
    func toDictionary() -> [String : AnyObject] {
        return self.toJSON() as [String : AnyObject]
    }
    
}

