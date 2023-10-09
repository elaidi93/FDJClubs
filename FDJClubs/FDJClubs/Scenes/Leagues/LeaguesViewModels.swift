//
//  LeaguesViewModels.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation
import Combine

class LeaguesViewModel: ObservableObject {
    
    @Published var leagues: [League] = []
    @Published var isLoading = true
    
    private var cancellables = Set<AnyCancellable>()
    private var allLeagues: [League] = []
    
    let leaguesService: LeaguesServiceProtocol
    
    init(leaguesService: LeaguesServiceProtocol) {
        self.leaguesService = leaguesService
    }
    
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
