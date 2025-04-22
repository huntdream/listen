//
//  PlaylistViewModel.swift
//  music
//
//  Created by Yu Mao on 4/18/25.
//


import SwiftUI

class PlaylistViewModel: ObservableObject {
    @Published var playlist: [Track] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false

    func loadPlaylist() {
        isLoading = true
        errorMessage = ""
        PlaylistService.shared.fetchDetail { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let tracks):
                    self?.playlist = tracks
                case .failure(let error):
                    self?.errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
