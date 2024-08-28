//
//  ContentView.swift
//  usersParsingApp
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isLoad = false
    @Query(sort: \User.name) var users: [User]
    @Environment(\.modelContext) var modelContext
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    if users.isEmpty {
                        ProgressView("Loading...")
                            .progressViewStyle(.circular)
                    }
                    else {
                        LazyVGrid(columns: columns) {
                            ForEach(users) { user in
                                NavigationLink() {
                                    DetailView(user: user)
                                } label: {
                                    HStack {
                                        Image(systemName: user.isActive ? "person.fill" : "person")
                                        Text(user.name)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .foregroundStyle(user.isActive ? .lionsmane : .platinum.opacity(0.4))
                                .padding(.leading, 10)
                               // .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .frame(height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lionsmane.opacity(0.2), lineWidth: 6)
                                )
                                .background(.ateneo.opacity(0.5))
                                .font(.title3)
                            }
                            
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(.horizontal, 4)
                        }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
                .navigationTitle("Users list")
                .navigationBarTitleDisplayMode(.large)
                .background(.ateneo.opacity(0.5))
                .preferredColorScheme(.dark)
                .task {
                    if users.isEmpty {
                        await fetchData()
                        //isLoad = true
                    }
                }
            }
        }
    }
    func fetchData() async {
        print("fetchData() called")
//        try? modelContext.delete(model: User.self)
        print(users.count)
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            var request = URLRequest(url: url)
            request.setValue("Safari/537.36", forHTTPHeaderField: "User-Agent")
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                //    print(String(data: data, encoding: .utf8) ?? 0)
                if let decodedUsers = try? decoder.decode([User].self, from: data) {
                    for user in decodedUsers {
                        modelContext.insert(user)
                        print("okkkk")
                    }
                }
                else {
                    print("not")
                }
                
            }
            catch {
                print("Failed to decode JSON: \(error)")
            }
//                do {
//                    users.removeAll()
//                    let decodedResponse = try decoder.decode([User].self, from: data)
//                    users = decodedResponse
//                } catch {
//                    print("Failed to decode JSON: \(error)")
        }
    }
    
}

#Preview {
    ContentView()
}
