//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Noureddine Legragui on 19/2/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let sectionsTitle: [String] = ["Popular", "Trending", "Trending Tv", "Upcoming Movies", "Top rated"]
    
    private let homeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewCell.self, forCellReuseIdentifier: CollectionViewCell.identifier)
        
        return tableView
    }()

    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        
        // Table View
        setupTableView()
        
        // Navigation bar
        configureNavBar()
    }
    
    private func setupTableView() {
        
        // Delegates
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // Header
        let headerView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 350))
        homeTableView.tableHeaderView = headerView
    }
    
    private func configureNavBar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .black
    }

}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitle[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }

}

