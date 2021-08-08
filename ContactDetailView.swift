//
//  ContactDetailView.swift
//  contacts
//
//  Created by Sena Lee on 8/8/21.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State var contact: Contact

    var body: some View {
        VStack {
            Image(contact.name)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .mask(Circle())
                .padding(.top, 5)
            Text(contact.name)
                .font(.largeTitle)
                .fontWeight(.medium)
                
            Text(contact.job)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.gray)
            VStack (alignment: .leading){
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
        ContactDetailView(contact: Contact(name: "holy zuck", job: "god"))
    }
}
