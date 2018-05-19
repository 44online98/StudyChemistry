//
//  HostingPricingModel.swift
//  PAVietNam
//
//  Created by SSN on 4/23/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import ObjectMapper

class HostingPricingModel: RESTResponse {
    
    var level           = ""
    var description      = ""
    var pricings        = [PricingsModel]()
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.level              <- map["level"]
        self.description        <- map["description"]
        self.pricings           <- map["pricings"]

    }
}
