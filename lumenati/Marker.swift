//
//  Marker.swift
//  lumenati
//
//  Created by Justin Chan on 12/21/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import Foundation

class Marker  {
    
    var id: String
    var title: String
    var address: String
    var category: String
    var description: String
    var url: String
    var latitude: Float
    var longitude: Float
    
    
    init(_id: String, title: String, address: String, category: String, description: String, url: String, latitude: Float, longitude: Float) {
        
        self.id = _id
        self.title = title
        self.address = address
        self.category = category
        self.description = description
        self.url = url
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
}
