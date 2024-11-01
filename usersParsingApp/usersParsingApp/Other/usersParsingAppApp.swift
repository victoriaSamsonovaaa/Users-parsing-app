//
//  usersParsingAppApp.swift
//  usersParsingApp
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI
import SwiftData

@main
struct usersParsingAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: User.self)
    }
}
