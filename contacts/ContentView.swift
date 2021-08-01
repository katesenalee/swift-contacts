//
//  ContentView.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Zuck")
                Text("Elon")
                Text("Putin")
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
