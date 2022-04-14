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

// MARK: - APIError

enum APIError {
    case failedToGetData
}

// MARK: - APICaller

class APICaller {
    
    // MARK: -
    
    static let shared = APICaller()
    
    // MARK: -
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.APY_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
