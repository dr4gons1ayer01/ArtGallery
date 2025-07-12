//
//  SceneDelegate.swift
//  ArtGallery
//
//  Created by Иван Семенов on 11.07.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        UINavigationBar.appearance().tintColor = UIColor.purple
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navController = UINavigationController(rootViewController: Builder.createMainView())
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

