//
//  MockLeaguesService.swift
//  FDJClubsTests
//
//  Created by Hamza EL Aidi on 10/10/2023.
//

import Foundation
import Combine
@testable import FDJClubs

class MockLeaguesService: LeaguesServiceProtocol {
    var returnedLeagues: Leagues?

    func getLeagues() -> AnyPublisher<Leagues, Error> {
        if let leagues = returnedLeagues {
            return Just(leagues)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Empty<Leagues, Error>()
                .eraseToAnyPublisher()
        }
    }
}
