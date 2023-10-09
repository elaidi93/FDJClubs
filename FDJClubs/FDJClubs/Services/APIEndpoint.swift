//
//  APIEndpoint.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation

enum APPEndpoint: APIEndpoint {
    case Leagues
    case Teams(leagueName: String)
    
    var baseURL: URL {
        return URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/")!
    }
    
    var path: String {
        switch self {
        case .Leagues:
            return "all_leagues.php"
        case let .Teams(leagueName):
            return "search_all_teams.php?l=\(leagueName)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .Leagues:
            return .get
        case .Teams:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .Leagues:
            return [:]
        case .Teams:
            return [:]
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .Leagues:
            return [:]
        case .Teams:
            return [:]
        }
    }
}
