//
//  PlaylistView.swift
//  music
//
//  Created by Yu Mao on 4/17/25.
//

import SwiftUI

struct TracksView: View {
    var playlist: [Track]
    
    var body: some View {
      
        if playlist.isEmpty {
            Text("No items to display").foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            List(playlist, id: \.id) { track in
                TrackView(track: track)
            }
        }
    }
}


