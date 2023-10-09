//
//  League.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation

struct League: Codable, Equatable {
    let id: String?
    let name: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idLeague"
        case name = "strLeague"
        case alternate = "strLeagueAlternate"
    }
}
