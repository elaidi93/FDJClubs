//
//  TeamsViewModel.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation
import Combine

class TeamsViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    let teamsService: TeamsServiceProtocol
    @Published var teams: [Team] = []
    
    init(teamsService: TeamsServiceProtocol) {
        self.teamsService = teamsService
    }
    
    func fetchTeams() {
        teamsService.getTeams()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case let .failure(error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] teams in
                self?.teams = teams.teams
            }).store(in: &cancellables)
    }
}
