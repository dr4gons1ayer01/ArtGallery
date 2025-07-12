//
//  Builder.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
}

class Builder {
    //view
    //presenter
    
    static private func createView<View: UIViewController & BaseViewProtocol>(viewType: View.Type, presenter: (View) -> View.PresenterType) -> UIViewController {
        let view = View()
        let presenter = presenter(view)
        view.presenter = presenter
        return view
    }
    
    static func createMainView() -> UIViewController {
        return self.createView(viewType: MainView.self) { view in
            MainViewPresenter(view: view)
        }
    }
    
    static func createDetailsView(artist: Artist) -> UIViewController {
        return self.createView(viewType: DetailsView.self) { view in
            DetailsViewPresenter(view: view, artist: artist)
        }
    }
    
    static func createArtworkView(artwork: Artwork) -> UIViewController {
        return self.createView(viewType: ArtworkDetailsView.self) { view in
            ArtworkDetailsViewPresenter(view: view, artwork: artwork)
        }
    }
}
