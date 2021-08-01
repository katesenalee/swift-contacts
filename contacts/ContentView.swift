//
//  ContentView.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    var contacts = [
        Contact(name: "zuck", job: "god"),
        Contact(name: "elon", job: "idk"),
        Contact(name: "putin", job: "russian")
    ]
    
    var body: some View {
        NavigationView {
            List (contacts) {
                Text($0.name)
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
