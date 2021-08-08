//
//  ContentView.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    
    var contacts = [
        Contact(name: "holy zuck", job: "god"),
        Contact(name: "elon musk", job: "idk"),
        Contact(name: "vladmir putin", job: "russian"),
        Contact(name: "ed sheeran", job: "girl you know i want ur love")
    ]
    
    var body: some View {
        NavigationView {
            List (contacts) { contact in
                NavigationLink (destination: ContactDetailView(contact: contact)) {
                    VStack(alignment: .leading){
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.job)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
