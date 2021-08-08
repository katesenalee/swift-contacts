//
//  ContactDetailView.swift
//  contacts
//
//  Created by Sena Lee on 8/8/21.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: Contact
    var body: some View {
        Text(contact.name)
            .font(.largeTitle)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "barack obama", job: "not sure"))
    }
}
