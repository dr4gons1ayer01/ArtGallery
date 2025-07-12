//
//  DetailsView.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import UIKit
import SwiftUI

protocol DetailsViewProtocol: BaseViewProtocol {
    
}

class DetailsView: UIViewController, DetailsViewProtocol {
    typealias PresenterType = DetailsViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = DetailsViewModel(artist: presenter!.artist)
        let contentView = DetailsViewContent(viewModel: viewModel) { artwork in
            self.presenter?.didSelectArtwork(artwork)
        }
        let content = UIHostingController(rootView: contentView)
        
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
