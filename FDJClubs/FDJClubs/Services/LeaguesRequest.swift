//
//  LeaguesRequest.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation
import Combine

protocol LeaguesServiceProtocol {
    func getLeagues() -> AnyPublisher<Leagues, Error>
}

struct Leagues: Decodable {
    let leagues: [League]
}

class LeaguesService: LeaguesServiceProtocol {
    
    let apiClient = URLSessionAPIClient<LeaguesEndpoint>()
    
    func getLeagues() -> AnyPublisher<Leagues, Error> {
        return apiClient.request(.Leagues)
    }
}
