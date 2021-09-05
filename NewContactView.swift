//
//  NewContactView.swift
//  contacts
//
//  Created by Sena Lee on 8/22/21.
//

import SwiftUI

struct NewContactView: View {
    @Binding var contacts: [Contact]
    @State var newContact = Contact(firstName: "", lastName: "", job: "", phone: "")
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $newContact.firstName)
                        .disableAutocorrection(true)
                    TextField("Last Name", text: $newContact.lastName)
                        .disableAutocorrection(true)
                    TextField("Company", text: $newContact.job)
                    TextField("Phone", text: $newContact.phone)
                }
                
                Section(header: Text("Rating")) {
                    Slider(value: $newContact.rating, in: 0...5, step: 1)
                    
                }
                
                Section {
                    Button("Save") {
                        contacts.append(newContact);
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("New Contact")
        }
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView(contacts: .constant([]))
    }
}
