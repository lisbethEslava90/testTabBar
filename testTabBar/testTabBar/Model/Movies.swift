//
//  Movies.swift
//  testTabBar
//
//  Created by Lisbeth Eslava on 9/03/20.
//  Copyright © 2020 Lisbeth Eslava. All rights reserved.
//
import Foundation
import ObjectMapper

class Movies: Mappable{
    
    var page: Int?
    var movies: [Movie]?
    var total_results: Int?
    var total_pages: Int?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.page           <- map["page"]
        self.movies         <- map["results"]
        self.total_results  <- map["total_results"]
        self.total_pages    <- map["total_pages"]
    }

    
    
    
  
}

