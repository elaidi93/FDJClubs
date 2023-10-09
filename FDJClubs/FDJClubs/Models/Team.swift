//
//  Team.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation

struct Team: Codable {
    let id: String?
    let name: String?
    let badge: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idTeam"
        case name = "strTeam"
        case badge = "strTeamBadge"
    }
}
