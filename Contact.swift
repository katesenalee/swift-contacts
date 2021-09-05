//
//  Contact.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import Foundation

struct Contact: Identifiable, Codable{
    var firstName: String
    var lastName: String
    var job: String
    var phone: String
    var rating: Double = 0.0
    var id = UUID()
    
}
