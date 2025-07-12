//
//  ExpandedArtworkView.swift
//  ArtGallery
//
//  Created by Иван Семенов on 12.07.2025.
//

import UIKit
import SwiftUI

//protocol ExpandedArtworkViewProtocol: BaseViewProtocol {
//    
//}
//
//class ExpandedArtworkView: UIViewController, ExpandedArtworkViewProtocol {
//    typealias PresenterType = ExpandedArtworkViewPresenterProtocol
//    var presenter: PresenterType?
//    var image: String = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let contentView = ExpandedArtworkViewContent(image: image) {
//            self.dismiss(animated: true)
//        }
//        let content = UIHostingController(rootView: contentView)
//
//        addChild(content)
//        view.addSubview(content.view)
//        content.view.frame = view.bounds
//        content.didMove(toParent: self)
//    }
//}

class ExpandedArtworkView: UIViewController {
    var image: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let contentView = ExpandedArtworkViewContent(image: image)

        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
}

