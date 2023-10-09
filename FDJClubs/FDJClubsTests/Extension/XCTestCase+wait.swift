//
//  XCTestCase+wait.swift
//  FDJClubsTests
//
//  Created by Hamza EL Aidi on 10/10/2023.
//

import Foundation
import XCTest

extension XCTestCase {
    func wait(interval: TimeInterval = 0.1, completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        
        waitForExpectations(timeout: interval + 0.3)
    }
}
