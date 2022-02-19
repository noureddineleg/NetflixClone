//
//  MainTabBarViewController.swift
//  NetflixClone
//
//  Created by Noureddine Legragui on 19/2/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    // MARK: - Local Helpers
    
    private func setupControllers() {
        
        // Load Controllers
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: UpCommingViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        // TabBar image
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        // TabBar title
        vc1.title = "Home"
        vc2.title = "Comming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        // TabBar color
        tabBar.tintColor = .label
        
        // Set ViewControllers
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }

}

