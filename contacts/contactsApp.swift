//
//  contactsApp.swift
//  contacts
//
//  Created by Sena Lee on 8/1/21.
//

import SwiftUI

@main
struct contactsApp: App {
    @ObservedObject var contactManager = ContactManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(contacts: $contactManager.contacts)
                .onAppear() {
                    contactManager.load()
                }
                .onChange(of: scenePhase, perform: { value in
                    if value == .inactive {
                        contactManager.save();
                    }
                })
        }
    }
}
