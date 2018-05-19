//
//  CartModel.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import ObjectMapper

class CartModel: RESTResponse {
    
    var id          = ""
    var kind        = ""
    var domain      = ""
    var time        = ""
    var note        = ""
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.id             <- map["id"]
        self.kind           <- map["kind"]
        self.domain         <- map["domain"]
        self.time           <- map["time"]
        self.note           <- map["note"]
    }
}
