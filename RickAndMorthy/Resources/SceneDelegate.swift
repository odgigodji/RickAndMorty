//
//  SceneDelegate.swift
//  RickAndMorthy
//
//  Created by Nikita Evdokimov on 23.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let mainTableViewController = CharactersTableViewController()
        window?.rootViewController = UINavigationController(rootViewController: mainTableViewController)
        window?.makeKeyAndVisible()
    }

}

