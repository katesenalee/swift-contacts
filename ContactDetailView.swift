//
//  ContactDetailView.swift
//  contacts
//
//  Created by Sena Lee on 8/8/21.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Binding var contact: Contact

    var body: some View {
        VStack {
            Image("\(contact.firstName) \(contact.lastName)")
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .mask(Circle())
                .padding(.top, 5)
            HStack {
                Text(contact.firstName)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                Text(contact.lastName)
                    .font(.largeTitle)
                    .fontWeight(.medium)
            }
            Text(contact.job)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .padding(.bottom)
            VStack (alignment: .leading){
                Text("phone: " + contact.phone)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.bottom)
                Text("Rating")
                Slider(value: $contact.rating, in: 0...5, step: 1)
            }
                .padding(30)
            Spacer()
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: .constant(Contact(firstName: "holy", lastName: "zuck", job: "god", phone: "+1 (000) 000-0000")))
    }
}
