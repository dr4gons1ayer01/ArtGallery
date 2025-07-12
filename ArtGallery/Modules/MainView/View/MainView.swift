//
//  MainView.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import UIKit
import SwiftUI

protocol MainViewProtocol: BaseViewProtocol {
    
}

class MainView: UIViewController, MainViewProtocol {
    typealias PresenterType = MainViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = MainViewModel()
        let contentView = MainViewContent(viewModel: viewModel) { artist in
            self.presenter?.didSelect(artist: artist)
        }
        let content = UIHostingController(rootView: contentView)
        
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
