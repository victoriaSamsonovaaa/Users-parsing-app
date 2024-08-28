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
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.id = try container.decode(UUID.self, forKey: .id)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.id, forKey: .id)
//    }
}
