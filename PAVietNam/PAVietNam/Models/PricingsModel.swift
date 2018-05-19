//
//  PricingsModel.swift
//  PAVietNam
//
//  Created by SSN on 4/27/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import ObjectMapper

class PricingsModel: RESTResponse {
    
    var kind          = ""
    var pricing       = [PricingModel]()
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.kind             <- map["kind"]
        self.pricing          <- map["pricing"]

    }
}
