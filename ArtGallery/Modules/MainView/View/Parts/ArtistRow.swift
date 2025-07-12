//
//  ArtistRow.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import SwiftUI

struct ArtistRow: View {
    let artist: Artist
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(artist.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(artist.name)
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(Color(red: 0.61, green: 0.59, blue: 0.78))

                Text(artist.bio)
                    .font(.body.weight(.semibold))
                    .lineLimit(2)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding()
        .background(.background).opacity(0.8)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}

//#Preview {
//    ArtistRow()
//}
