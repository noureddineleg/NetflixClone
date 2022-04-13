//
//  APICaller.swift
//  NetflixClone
//
//  Created by Noureddine Legragui on 22/2/2022.
//

import Foundation

// MARK: - Constants

struct Constants {
    
    // MARK: -
    
    static let APY_KEY = "876bf1baef4476fe88f3f780c710e770"
    static let baseURL = "https://api.themoviedb.org"
    
}

// MARK: - APICaller

class APICaller {
    
    // MARK: -
    
    static let shared = APICaller()
    
    // MARK: -
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.APY_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}
