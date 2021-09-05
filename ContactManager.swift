//
//  ContactManager.swift
//  contacts
//
//  Created by Sena Lee on 9/5/21.
//

import Foundation
import SwiftUI

class ContactManager: ObservableObject {
    @Published var contacts: [Contact] = []
    
    func getArchiveURL() -> URL {
        let plistName = "contacts.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedContacts = try? propertyListEncoder.encode(contacts)
        try? encodedContacts?.write(to: archiveURL, options: .noFileProtection)
        print("saving here")
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalContacts: [Contact]!
        
        if let retrievedContactsData = try? Data(contentsOf: archiveURL),
           let decodedContacts = try? propertyListDecoder.decode(Array<Contact>.self, from: retrievedContactsData) {
            finalContacts = decodedContacts
        } else {
            finalContacts = [
                Contact(firstName: "holy", lastName: "zuck", job: "god", phone: "+1 (000) 000-0000"),
                Contact(firstName: "elon", lastName: "musk", job: "idk", phone: "+1 (000) 000-0000"),
                Contact(firstName: "vladmir", lastName: "putin", job: "russian", phone: "+1 (000) 000-0000"),
                Contact(firstName: "ed", lastName: "sheeran", job: "girl you know i want ur love", phone: "+1 (000) 000-0000"),
                Contact(firstName: "grass", lastName: "toucher", job: "toucher of grass", phone: "+1 (000) 000-0000")
            ]
        }
        contacts = finalContacts
    }
}
