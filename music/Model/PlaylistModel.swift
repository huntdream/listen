import Foundation

struct PlaylistResponse: Codable {
    let code: Int
    let playlist: Playlist
}

struct Playlist: Codable {
    let id: Int
    let name: String
    let coverImgUrl: String
    let description: String?
    let tracks: [Track]
}

