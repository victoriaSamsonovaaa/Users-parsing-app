//
//  User.swift
//  usersParsingApp
//
//  Created by Victoria Samsonova on 26.08.24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    var formattedDate: String {
        registered.formatted(date: .complete, time: .omitted)
    }

    struct Friend: Codable, Identifiable {
        let id: UUID
        let name: String
    }
}


