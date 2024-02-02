
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
