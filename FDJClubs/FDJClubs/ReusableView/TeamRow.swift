//
//  TeamRow.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import SwiftUI

struct TeamRow: View {
    var item: Team

    var body: some View {
        AsyncImage(url: URL(string: item.badge ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
            case .failure:
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    TeamRow(
        item: Team(
            id: "FakeId",
            name: "Real Madrid",
            badge: "Fake url"
        )
    )
}
