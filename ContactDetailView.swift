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
        VStack {
            Image(contact.name)
                .resizable()
                .scaledToFill()
                .frame(width: 175, height: 175)
                .mask(Circle())
                .padding(.top, 30)
            Text(contact.name)
                .font(.largeTitle)
                
            Text(contact.job)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .padding(5)
            Spacer()
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "holy zuck", job: "god"))
    }
}
