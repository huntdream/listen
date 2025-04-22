//
//  Track.swift
//  music
//
//  Created by Yu Mao on 4/17/25.
//

import Foundation

struct Track: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let ar: [Artist]
    let al: Album
    let dt: Int
    
    var durationText: String {
        let totalSeconds = dt / 1000
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    
    var coverUrl: String {
        al.picUrl.replacingOccurrences(of: "http://", with: "https://")
    }
    
    var artistsText: String {
        ar.map { $0.name }.joined(separator: "/")
    }
}

struct Artist: Codable, Equatable {
    let id: Int
    let name: String
}

struct Album: Codable, Equatable {
    let id: Int
    let name: String
    let picUrl: String
}

struct CheckResult:Codable {
    let message: String
    let success: Bool
}

struct TracksDetail:Decodable {
    let songs:[Track]
}

struct TrackURLResult:Decodable {
    let data: [TrackURL]
}

struct TrackURL:Decodable {
    let url:String
}
