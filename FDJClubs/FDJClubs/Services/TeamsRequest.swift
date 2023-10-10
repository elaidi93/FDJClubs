//
//  TeamsRequest.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation
import Combine

protocol TeamsServiceProtocol {
    func getTeams() -> AnyPublisher<Teams, Error>
}

struct Teams: Decodable {
    let teams: [Team]
}

class TeamsService: TeamsServiceProtocol {
    
    private let leagueName: String
    
    init(leagueName: String) {
        self.leagueName = leagueName
    }
    
    let apiClient = URLSessionAPIClient<APPEndpoint>()
    
    func getTeams() -> AnyPublisher<Teams, Error> {
        return apiClient.request(.Teams(leagueName: self.leagueName))
    }
}
