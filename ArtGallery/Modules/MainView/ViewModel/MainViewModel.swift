//
//  MainViewModel.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var artists: [Artist] = []
    @Published var searchText: String = ""
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    var filteredArtists: [Artist] {
        if searchText.isEmpty {
            return artists
        } else {
            return artists.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    init() {
        Task {
            await loadArtists()
        }
    }
    
    @MainActor
    func loadArtists() async {
        isLoading = true
        do {
            let result = try await NetworkService().fetchArtists()
            self.artists = result
        } catch {
            print("Ошибка загрузки: \(error)")
        }
        isLoading = false
    }
    
    func loadArtistsMock() {
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Не удалось загрузить artists")
            return
        }
        
        do {
            let decoded = try JSONDecoder().decode(ArtistResponse.self, from: data)
            self.artists = decoded.artists
        } catch {
            print("Ошибка декодирования: \(error)")
        }
    }
}
