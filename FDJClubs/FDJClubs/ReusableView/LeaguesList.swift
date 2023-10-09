//
//  LeaguesList.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 08/10/2023.
//

import SwiftUI

struct LeaguesList: View {
    let leagues: [League]
    let onSelect: (_ league: League) -> Void
    
    var body: some View {
        List {
            ForEach(leagues, id: \.id) { league in
                Text(league.name ?? "")
                    .onTapGesture {
                        onSelect(league)
                    }
            }
        }
    }
}

#Preview {
    let leagues: [League] = [
        League(
            id: UUID().uuidString,
            name: "Premier league",
            alternate: nil
        ),
        League(
            id: UUID().uuidString,
            name: "La Liga",
            alternate: nil
        ),
        League(
            id: UUID().uuidString,
            name: "Bundesliga",
            alternate: nil
        )
    ]
    
    return LeaguesList(leagues: leagues) { _ in
        
    }
}
