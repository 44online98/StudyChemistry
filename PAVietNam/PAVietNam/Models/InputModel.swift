//
//  InputModel.swift
//  PAVietNam
//
//  Created by SSN on 4/20/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import ObjectMapper

class InputModel: RESTResponse {
    
    var title           = ""
    var value           = ""
    var kind            = ""
    var placeholder     = ""
    var datas           = [String]()

    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.title              <- map["title"]
        self.value              <- map["value"]
        self.kind               <- map["kind"]
        self.placeholder        <- map["placeholder"]
        self.datas              <- map["datas"]
    }
}
