//
//  ContentView.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 08/10/2023.
//

import SwiftUI

struct LeaguesView: View {
    
    @State private var searchText: String = ""
    @StateObject var viewModel = LeaguesViewModel(leaguesService: LeaguesService())
    
    var body: some View {
        NavigationStack {
            VStack {
                LeaguesList(leagues: viewModel.leagues) { league in
                    
                }
            }
            .navigationTitle("Search League")
        }
        .onAppear {
            viewModel.fetchLeagues()
        }
        .searchable(text: $searchText,
                    prompt: Text("Search"))
        .onChange(of: searchText) { _, newQuery in
            viewModel.search(searchText: newQuery)
        }
    }
}

#Preview {
    let viewModel = LeaguesViewModel(leaguesService: LeaguesService())
    viewModel.leagues = [
        League(
            id: "1",
            name: "Ligne 1",
            sport: nil,
            alternate: nil
        ),
        League(
            id: "2",
            name: "Marseille",
            sport: nil,
            alternate: nil
        )
    ]
    return LeaguesView(viewModel: viewModel)
}
