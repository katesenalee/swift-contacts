//
//  ContentView.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var contacts = [
        Contact(name: "holy zuck", job: "god", phone: "+1 (000) 000-0000"),
        Contact(name: "elon musk", job: "idk", phone: "+1 (000) 000-0000"),
        Contact(name: "vladmir putin", job: "russian", phone: "+1 (000) 000-0000"),
        Contact(name: "ed sheeran", job: "girl you know i want ur love", phone: "+1 (000) 000-0000")
    ]
    
    var body: some View {
        NavigationView {
            List (contacts) { contact in
                let index = contacts.firstIndex {
                    $0.name == contact.name
                }!
                NavigationLink (destination: ContactDetailView(contact: $contacts[index])) {
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
