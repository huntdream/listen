//
//  Player.swift
//  music
//
//  Created by Yu Mao on 4/14/25.
//
import SwiftUI
import Combine


struct PlayerView: View {
    @EnvironmentObject var playerState: PlayerState

    var body: some View {
        ZStack {
            // HStack: Left and Right
            HStack {
                // Left: Cover + Info
                if let track = playerState.currentTrack {
                    HStack(spacing: 12) {
                        CoverImageView(url: track.coverUrl)
                                                  
                        VStack(alignment: .leading) {
                            Text(track.name)
                                .font(.headline)
                                .lineLimit(1)
                            Text(track.artistsText)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                }

                Spacer()

                // Right: Placeholder for future buttons (e.g. volume, settings)
                HStack {
                    // You can add other actions here
                }
            }
            .padding(.horizontal)

           
            HStack(spacing: 32) {
                Button(action: {
                    // Previous track action
                }) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                }.buttonStyle(.plain)

                Button(action: {
                    if playerState.isPlaying {
                        playerState.pause()
                    } else {
                        playerState.play()
                    }
                   
                }) {
                    Image(systemName: playerState.isPlaying ? "pause.fill" : "play.fill")
                        .font(.title2)
                }.buttonStyle(.plain)

                Button(action: {
                  
                }) {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }.buttonStyle(.plain)
            }
            .padding(.vertical)
        }
        .padding(.vertical, 8)
        
    }
}


#Preview {
    let mockPlayerState = PlayerState()
    mockPlayerState.currentTrack = Track(
        id: 1,
        name: "Mock Song",
        ar: [Artist(id: 1, name: "Mock Artist")],
        al: Album(id: 1, name: "Mock Album", picUrl: "https://example.com/mock-cover.jpg"),
        dt: 210000
    )
    mockPlayerState.isPlaying = true
    return PlayerView().environmentObject(mockPlayerState)
}
