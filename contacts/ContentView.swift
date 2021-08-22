//  ContentView.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.

import SwiftUI

struct ContentView: View {
    
    @State var contacts = [
        Contact(firstName: "holy", lastName: "zuck", job: "god", phone: "+1 (000) 000-0000"),
        Contact(firstName: "elon", lastName: "musk", job: "idk", phone: "+1 (000) 000-0000"),
        Contact(firstName: "vladmir", lastName: "putin", job: "russian", phone: "+1 (000) 000-0000"),
        Contact(firstName: "ed", lastName: "sheeran", job: "girl you know i want ur love", phone: "+1 (000) 000-0000"),
        Contact(firstName: "grass", lastName: "toucher", job: "toucher of grass", phone: "+1 (000) 000-0000")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach (contacts) { contact in
                    let index = contacts.firstIndex {
                        $0.id == contact.id
                    }!
                    NavigationLink (destination: ContactDetailView(contact: $contacts[index])) {
                        VStack(alignment: .leading){
                            HStack(spacing: 5) {
                                Text(contact.firstName)
                                    .font(.headline)
                                    .padding(0)
                                Text(contact.lastName)
                                    .font(.headline)
                                    .padding(0)
                            }
                            Text(contact.job)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    contacts.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    contacts.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("Contacts")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
