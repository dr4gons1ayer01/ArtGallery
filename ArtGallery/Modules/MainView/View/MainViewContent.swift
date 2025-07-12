//
//  MainViewContent.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import SwiftUI

struct MainViewContent: View {
    @ObservedObject var viewModel: MainViewModel
    var onSelect: (Artist) -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {

                //Title
                HStack {
                    Text("Artists")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)

                    Spacer()
                    
                    Button {
                        //action
                        
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.purple)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)

                //Search
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.purple)
                    TextField("Search", text: $viewModel.searchText)
                        .font(.system(size: 16))
                        .foregroundColor(.purple)
                        .accentColor(.blue)
                }
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                if viewModel.isLoading {
                    ProgressView("Loading artists…")
                        .padding()
                }

                //List
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.filteredArtists) { artist in
                            Button {
                                onSelect(artist)
                            } label: {
                                ArtistRow(artist: artist)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
                
                Spacer(minLength: 12)
            }
            .navigationBarHidden(true)
            .background(.bgMain)
        }
    }
}

//#Preview {
//    MainViewContent(viewModel: MainViewModel())
//}
