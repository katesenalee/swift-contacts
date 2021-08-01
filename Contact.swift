//
//  Contact.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import Foundation

struct Contact: Identifiable{
    var name: String
    var job: String
    var rating: Double = 0.0
    var id = UUID()
    
}
