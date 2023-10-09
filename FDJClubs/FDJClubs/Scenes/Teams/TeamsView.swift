//
//  TeamsView.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import SwiftUI

struct TeamsView: View {
    let teams : [Team]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: createGridItems, spacing: 10) {
                ForEach(teams, id: \.id) { item in
                    TeamRow(item: item)
                }
            }
        }
    }
    
    private var createGridItems: [GridItem] {
        Array(repeating: .init(.fixed(200)), count: 2)
    }
}

#Preview {
    TeamsView(
        teams: [Team(
            id: nil,
            name: "Real Madrid",
            badge: nil
        ),Team(
            id: nil,
            name: "Barcelone",
            badge: nil
        ),Team(
            id: nil,
            name: "Athlético Madrid",
            badge: nil
        )]
    )
}
