//
//  ArtworkDetailsViewContent.swift
//  ArtGallery
//
//  Created by Иван Семенов on 12.07.2025.
//

import SwiftUI

struct ArtworkDetailsViewContent: View {
    let viewModel: ArtworkDetailsViewModel
    let onExpand: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(viewModel.artwork.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text(viewModel.artwork.image)
                    .font(.title)
                    .bold()
                
                Text(viewModel.artwork.info)
                    .font(.body)
                
                Spacer()
                
                Button {
                    onExpand()
                } label: {
                    Text("Развернуть")
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.purple)
                        .cornerRadius(12)
                }
                .padding()
            }
        }
    }
}

//#Preview {
//    FullscreenArtworkViewContent()
//}
