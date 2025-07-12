//
//  ArtworkDetailsViewPresenter.swift
//  ArtGallery
//
//  Created by Иван Семенов on 12.07.2025.
//

import UIKit

protocol ArtworkDetailsViewPresenterProtocol: AnyObject {
    var artwork: Artwork { get }
    func showExpandedView()
}

class ArtworkDetailsViewPresenter: ArtworkDetailsViewPresenterProtocol {
    weak var view: (any ArtworkDetailsViewProtocol)?
    let artwork: Artwork
    
    init(view: any ArtworkDetailsViewProtocol, artwork: Artwork) {
        self.view = view
        self.artwork = artwork
    }
    
    func showExpandedView() {
        let expandedVC = ExpandedArtworkView()
        expandedVC.image = artwork.image
        
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(expandedVC, animated: true)
        }
    }
}
