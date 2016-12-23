//
//  User.swift
//  lumenati
//
//  Created by Justin Chan on 12/21/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import Foundation

class User  {
    
    var id: String
    var first_name: String
    var last_name: String
    var username: String
    var email: String
    var groups: [NSDictionary]
    var markers: [NSDictionary]


    init(_id: String, first_name: String, last_name: String, username: String, email: String, groups: [NSDictionary], markers: [NSDictionary]) {
          
        self.id = _id
        self.first_name = first_name
        self.last_name = last_name
        self.username = username
        self.email = email
        self.groups = groups
        self.markers = markers
        
    }
    
}

