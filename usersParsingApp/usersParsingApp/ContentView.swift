//
//  ContentView.swift
//  usersParsingApp
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
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
                            .padding()
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
                .navigationTitle("Users list")
                .navigationBarTitleDisplayMode(.large)
                .background(.ateneo.opacity(0.5))
                .preferredColorScheme(.dark)
                .task {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
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
                do {
                    users.removeAll()
                    let decodedResponse = try decoder.decode([User].self, from: data)
                    users = decodedResponse
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } catch {
                print("Failed to fetch data: \(error)")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
