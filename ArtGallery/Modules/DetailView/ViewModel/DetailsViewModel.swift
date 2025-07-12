//
//  DetailsViewModel.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import Foundation

class DetailsViewModel {
    let artist: Artist
    var artworks: [Artwork] { artist.works }
    
    init(artist: Artist) {
        self.artist = artist
    }
}
