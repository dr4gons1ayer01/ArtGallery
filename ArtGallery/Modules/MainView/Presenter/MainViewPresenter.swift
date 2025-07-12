//
//  MainViewPresenter.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import UIKit

protocol MainViewPresenterProtocol: AnyObject {
    func didSelect(artist: Artist)
}

class MainViewPresenter: MainViewPresenterProtocol {
    weak var view: (any MainViewProtocol)?
    
    init(view: any MainViewProtocol) {
        self.view = view
    }
    
    func didSelect(artist: Artist) {
        let detailsVC = Builder.createDetailsView(artist: artist)
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
