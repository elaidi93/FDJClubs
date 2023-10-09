//
//  LeaguesViewModelTests.swift
//  FDJClubsTests
//
//  Created by Hamza EL Aidi on 10/10/2023.
//

import Foundation

import XCTest
import Combine
@testable import FDJClubs

class LeaguesViewModelTests: XCTestCase {

    var viewModel: LeaguesViewModel!
    var mockLeaguesService: MockLeaguesService!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        mockLeaguesService = MockLeaguesService()
        viewModel = LeaguesViewModel(leaguesService: mockLeaguesService)
    }

    override func tearDown() {
        viewModel = nil
        mockLeaguesService = nil
        super.tearDown()
    }

    func testFetchLeagues() {
        // Given
        let leagues = Leagues(
            leagues: [League(
                id: "1",
                name: "Ligue 1",
                alternate: "Ligue 1 Conforama"
            )]
        )
        mockLeaguesService.returnedLeagues = leagues

        // When
        viewModel.fetchLeagues()
        
        // Then
        XCTAssertTrue(viewModel.isLoading)

        let expectation = XCTestExpectation(description: "Wait for fetchLeagues completion")
        viewModel.$leagues.sink { _ in
            expectation.fulfill()
        }.store(in: &cancellables)

        wait {
            XCTAssertEqual(self.viewModel.leagues, leagues.leagues)
            XCTAssertFalse(self.viewModel.isLoading)
        }
    }
}
