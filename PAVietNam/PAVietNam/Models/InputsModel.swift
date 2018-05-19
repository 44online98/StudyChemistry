//
//  InputsModel.swift
//  PAVietNam
//
//  Created by SSN on 4/26/18.
//  Copyright © 2018 SSN. All rights reserved.
//


import Foundation
import ObjectMapper

class InputsModel: RESTResponse {
    
    var section          = ""
    var inputs           = [InputModel]()
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.section             <- map["section"]
        self.inputs              <- map["inputs"]
    }
}
