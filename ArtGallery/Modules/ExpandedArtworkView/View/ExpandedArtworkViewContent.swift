//
//  ExpandedArtworkViewContent.swift
//  ArtGallery
//
//  Created by Иван Семенов on 12.07.2025.
//

import SwiftUI

struct ExpandedArtworkViewContent: View {
    let image: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()

            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.purple)
                    .padding(10)
                    .background(Color.black.opacity(0.5))
                    .clipShape(Circle())
            }
            .padding(.trailing, 20)
        }
    }
}
