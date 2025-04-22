import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = PlaylistViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            } else {
                TracksView(playlist: viewModel.playlist)
            }
        }
        .onAppear {
            viewModel.loadPlaylist()
        }
    }
}

#Preview {
    MainView()
}
