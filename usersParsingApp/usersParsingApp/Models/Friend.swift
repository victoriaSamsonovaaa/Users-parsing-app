//
//  Friend.swift
//  usersParsingApp
//
//  Created by Victoria Samsonova on 28.08.24.
//

import Foundation
import SwiftData

class Friend: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    let id: UUID
    let name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
