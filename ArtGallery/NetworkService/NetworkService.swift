//
//  NetworkService.swift
//  ArtGallery
//
//  Created by Иван Семенов on 12.07.2025.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed
    case invalidData
    case decodingFailed
}

final class NetworkService {
    private let baseURL = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    
    func fetchArtists() async throws -> [Artist] {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        do {
            let decoded = try JSONDecoder().decode(ArtistResponse.self, from: data)
            return decoded.artists
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
