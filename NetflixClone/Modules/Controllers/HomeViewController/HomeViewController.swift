//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Noureddine Legragui on 19/2/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        
        return tableView
    }()

    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }

}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World!"
        return cell
    }

}

