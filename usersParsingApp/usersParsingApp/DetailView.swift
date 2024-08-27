//
//  DetailView.swift
//  usersParsingApp
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI

struct DetailView: View {
let user: User
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal info") {
                    Text("Age: \(user.age)")
                    Text("Address: \(user.address)")
                    Text("Email: \(user.email)")
                    Text("Company: \(user.company)")
                }
                .listRowBackground(Color.ateneo.opacity(0.5))
                
                Section("About") {
                    DisclosureGroup("More info") {
                        Text("\(user.about)")
                    }
                }
                .listRowBackground(Color.ateneo.opacity(0.5))
                
                Section("Tags") {
                    Text("#" + user.tags.joined(separator: "  #"))
                        .fontWeight(.bold)
                }
                .listRowBackground(Color.ateneo.opacity(0.5))
                
                Section("Registered date") {
                    Text("\(user.formattedDate)")
                }
                .listRowBackground(Color.ateneo.opacity(0.5))
                
                Section("Friends") {
                    ForEach(user.friends, id: \.id) { friend in
                        Text("\(friend.name)")
                    }
                }
                .listRowBackground(Color.ateneo.opacity(0.5))
            }
            .foregroundStyle(.lionsmane)
            .scrollContentBackground(.hidden)
            .background(Color.ateneo.opacity(0.5))
            .preferredColorScheme(.dark)
            .navigationTitle(user.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: user.isActive ? "moonphase.new.moon.inverse" : "")
                            .renderingMode(.original)
                            .foregroundStyle(.yellow).opacity(0.7)
                        Text(user.isActive ? "Active" : "")
                    }
                    .shadow(color: Color.yellow, radius: 8)
                }
            }
        }
    }
}

#Preview {
    
    DetailView(user: User(id: UUID(), isActive: true, name: "Alford Rodriguez", age: 21, company: "Imkam", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["tag1", "tag2"], friends: [User.Friend(id: UUID(), name: "Jane Smith")]))
}
