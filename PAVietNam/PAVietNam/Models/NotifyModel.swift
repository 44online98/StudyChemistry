//
//  NotifyModel.swift
//  PAVietNam
//
//  Created by SSN on 5/5/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import ObjectMapper

class NotifyModel: RESTResponse {
    
    var title           = ""
    var description     = ""
    var isRead          = false
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.title              <- map["title"]
        self.description        <- map["description"]
        self.isRead             <- map["isRead"]
    }
}
