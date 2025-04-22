import SwiftUI

struct TrackView: View {
    @EnvironmentObject var playerState: PlayerState
    let track: Track
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Cover image
            CoverImageView(url: track.coverUrl)
            
            HStack() {
                
                // Track info
                VStack(alignment: .leading, spacing: 4) {
                    Text(track.name)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(track.artistsText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    
                }
                Spacer()
                Text(track.durationText)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            playTrack()
        }
    }
    
    func playTrack(){
        // playerState.currentTrack = track
        playerState.play(track: track)
    }
}
