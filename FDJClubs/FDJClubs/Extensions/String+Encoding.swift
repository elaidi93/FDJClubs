//
//  String+Encoding.swift
//  FDJClubs
//
//  Created by Hamza EL Aidi on 09/10/2023.
//

import Foundation

extension String {
    
    public var urlHost: String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
