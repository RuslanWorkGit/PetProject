//
//  Genre.swift
//  Film-info
//
//  Created by Ruslan Liulka on 13.12.2023.
//

import Foundation

// MARK: - Welcome
struct GenreList: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
