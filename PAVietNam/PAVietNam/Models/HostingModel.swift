//
//  HostingModel.swift
//  PAVietNam
//
//  Created by SSN on 4/20/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import ObjectMapper

class HostingModel: RESTResponse {
    
    var kind        = ""
    var hostings    = [String]()
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.kind           <- map["kind"]
        self.hostings       <- map["hostings"]
    }
}
