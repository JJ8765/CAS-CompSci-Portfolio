//
//  FortuneModel.swift
//  TarotCard
//
//  Created by Jaden Lin on 1/23/23.
//

import Foundation

struct Fortune: Codable {
    let success: Bool
    let cookie: Cookie
}

// MARK: - Cookie
struct Cookie: Codable {
    let fortune: String
    let luckyNumbers: [Int]
}
