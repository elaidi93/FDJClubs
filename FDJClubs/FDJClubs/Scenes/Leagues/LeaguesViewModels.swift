//
//  LeaguesViewModels.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation
import Combine

class LeaguesViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    let leaguesService: LeaguesServiceProtocol
    @Published var leagues: [League] = []
    private var allLeagues: [League] = []
    @Published var isLoading = true
    
    init(leaguesService: LeaguesServiceProtocol) {
        self.leaguesService = leaguesService
    }
    
    // Search leagues
    func search(searchText: String) {
        if searchText.isEmpty {
            leagues = allLeagues
        } else {
            leagues = allLeagues.filter {
                $0.name?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    
    func fetchLeagues() {
        leaguesService.getLeagues()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoading = false
            }, receiveValue: { [weak self] leagues in
                self?.leagues = leagues.leagues
                self?.allLeagues = leagues.leagues
            }).store(in: &cancellables)
    }
}
