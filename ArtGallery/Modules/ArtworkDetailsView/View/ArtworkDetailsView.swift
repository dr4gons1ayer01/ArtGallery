//
//  ArtworkDetailsView.swift
//  ArtGallery
//
//  Created by Иван Семенов on 12.07.2025.
//

import UIKit
import SwiftUI

protocol ArtworkDetailsViewProtocol: BaseViewProtocol {
    
}

class ArtworkDetailsView: UIViewController, ArtworkDetailsViewProtocol {
    typealias PresenterType = ArtworkDetailsViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = ArtworkDetailsViewModel(artwork: presenter!.artwork)
        let contentView = ArtworkDetailsViewContent(viewModel: viewModel) {
            self.presenter!.showExpandedView()
        }
        let content = UIHostingController(rootView: contentView)
        
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
