//
//  DetailsViewContent.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import SwiftUI

struct DetailsViewContent: View {
    let viewModel: DetailsViewModel
    var onSelectedArtwork: (Artwork) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Image(viewModel.artist.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
                
                Text(viewModel.artist.name)
                    .font(.title)
                    .bold()
                
                Text(viewModel.artist.bio)
                    .font(.body)
                
                Text("Works")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                ForEach(viewModel.artworks) { artwork in
                    Button {
                        onSelectedArtwork(artwork)
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            Image(artwork.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 180)
                                .clipped()
                                .foregroundColor(.purple)
                                .cornerRadius(10)
                            
                            Text(artwork.title)
                                .font(.body)
                                .foregroundColor(.purple)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    DetailsViewContent()
//}
