//
//  TeamsViewModelTests.swift
//  FDJClubsTests
//
//  Created by Hamza EL Aidi on 10/10/2023.
//

import XCTest
import Combine
@testable import FDJClubs

class TeamsViewModelTests: XCTestCase {

    var viewModel: TeamsViewModel!
    var mockTeamsService: MockTeamsService!

    override func setUp() {
        super.setUp()
        mockTeamsService = MockTeamsService()
        viewModel = TeamsViewModel(teamsService: mockTeamsService)
    }

    override func tearDown() {
        viewModel = nil
        mockTeamsService = nil
        super.tearDown()
    }

    func testFetchTeams() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch Teams")
        let expectedTeams = [
            Team(
                id: "1",
                name: "PSJ",
                badge: "https://www.thesportsdb.com/images/media/team/badge/z69be41598797026.png"
            ),
            Team(
                id: "2",
                name: "Marseille",
                badge: "https://www.thesportsdb.com/images/media/team/badge/z69be41598797026.png"
            )
        ]
        mockTeamsService.stubbedTeams = expectedTeams
        
        // When
        viewModel.fetchTeams()
        
        // Then
        wait {
            XCTAssertEqual(self.viewModel.teams, expectedTeams)
            XCTAssertEqual(self.viewModel.teams.count, 2)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
