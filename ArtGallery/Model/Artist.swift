//
//  Artist.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import Foundation

struct ArtistResponse: Codable {
    let artists: [Artist]
}

struct Artist: Codable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let bio: String
    let image: String
    let works: [Artwork]
}

struct Artwork: Codable, Identifiable {
    let id: UUID = UUID()
    let title: String
    let image: String
    let info: String
}
