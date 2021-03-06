//  ContentView.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.

import SwiftUI

struct ContentView: View {
    
    @Binding var contacts: [Contact]
    @State var isSheetShown = false;
    
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
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    isSheetShown = true
                                }, label: {
                                    Image(systemName: "plus")
                                }))
        }
        .sheet(isPresented: $isSheetShown, content: {
            NewContactView(contacts: $contacts)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contacts: .constant([]))
    }
}
