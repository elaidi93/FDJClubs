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
                if viewModel.isLoading {
                    LoaderView()
                } else {
                    List {
                        ForEach(viewModel.leagues, id: \.id) { league in
                            NavigationLink(league.name ?? "") { TeamsView(
                                viewModel: TeamsViewModel(
                                    teamsService: TeamsService(
                                        leagueName: league.name ?? ""
                                    )
                                )
                            )}
                        }
                    }
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

struct LoaderView: View {
    
    var body: some View {
        ProgressView()
            .scaledToFit()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
    }
}

#Preview {
    let viewModel = LeaguesViewModel(leaguesService: LeaguesService())
    viewModel.leagues = [
        League(
            id: UUID().uuidString,
            name: "Ligne 1",
            alternate: nil
        ),
        League(
            id: UUID().uuidString,
            name: "Marseille",
            alternate: nil
        )
    ]
    return LeaguesView(viewModel: viewModel)
}
