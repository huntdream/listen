//
//  PlayerState.swift
//  music
//
//  Created by Yu Mao on 4/18/25.
//


import SwiftUI
import Combine
import AVFoundation
import MediaPlayer

class PlayerState: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var currentTrack: Track? = nil
    @Published var playlist: [Track] = []
    
    private var player: AVPlayer = AVPlayer()
    
    init() {
        observePlayingState()
    }
    
    private func observePlayingState() {
        player.publisher(for: \.timeControlStatus)
            .receive(on: DispatchQueue.main)
            .map { $0 == .playing }
            .assign(to: &$isPlaying)
    }
    
    func play (track: Track?=nil) {
        if let track = track {
            self.currentTrack = track
        } else {
            player.play()
            
            return
        }
        
        guard let track = currentTrack else {return}
        
        TrackService.shared.fetchUrl(id: track.id) { result in
            switch result {
            case .success(let url):
                DispatchQueue.main.async {
                    let newItem = AVPlayerItem(url: url)
                    if self.player.currentItem == nil || self.player.currentItem?.asset != AVURLAsset(url: url) {
                        self.player.replaceCurrentItem(with: newItem)
                    }
                    self.player.play()
                }
            case .failure(let error):
                print("Error fetching track URL: \(error)")
            }
        }
    }
    
    func pause() {
        player.pause()
    }
    
}

