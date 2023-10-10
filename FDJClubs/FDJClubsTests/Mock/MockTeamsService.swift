//
//  MockTeamsService.swift
//  FDJClubsTests
//
//  Created by Hamza EL Aidi on 10/10/2023.
//

import XCTest
import Combine
@testable import FDJClubs

class MockTeamsService: TeamsServiceProtocol {

    var stubbedTeams: [Team] = []

    func getTeams() -> AnyPublisher<Teams, Error> {
        let response = Teams(teams: stubbedTeams)
        return Just(response)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
