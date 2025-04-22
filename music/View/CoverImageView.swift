import SwiftUI

struct CoverImageView: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .cornerRadius(8)
            case .failure(_):
                Color.gray
                    .frame(width: 36, height: 36)
                    .cornerRadius(8)
                    .overlay(Image(systemName: "photo").foregroundColor(.white))
            case .empty:
                ProgressView()
                    .frame(width: 36, height: 36)
            @unknown default:
                EmptyView()
            }
        }
    }
}