//
//  DetailsViewPresenter.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import UIKit

protocol DetailsViewPresenterProtocol: AnyObject {
    var artist: Artist { get }
    func didSelectArtwork(_ artwork: Artwork)
}

class DetailsViewPresenter: DetailsViewPresenterProtocol {
    weak var view: (any DetailsViewProtocol)?
    let artist: Artist
    
    init(view: any DetailsViewProtocol, artist: Artist) {
        self.view = view
        self.artist = artist
    }
    
    func didSelectArtwork(_ artwork: Artwork) {
        let fullScreenVC = Builder.createArtworkView(artwork: artwork)
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(fullScreenVC, animated: true)
        }
    }
}
