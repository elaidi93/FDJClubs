//
//  TeamsView.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import SwiftUI

struct TeamsView: View {
    
    @ObservedObject var viewModel: TeamsViewModel
    
    init(viewModel: TeamsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: createGridItems, spacing: 10) {
                    ForEach(viewModel.teams, id: \.id) { item in
                        TeamRow(item: item)
                    }
                }
                .navigationTitle("Teams")
            }
            .onAppear {
                viewModel.fetchTeams()
            }
        }
    }
    
    private var createGridItems: [GridItem] {
        Array(repeating: .init(.fixed(200)), count: 2)
    }
}

#Preview {
    TeamsView(viewModel: TeamsViewModel(teamsService: TeamsService(leagueName: "Real Madrid")))
}
