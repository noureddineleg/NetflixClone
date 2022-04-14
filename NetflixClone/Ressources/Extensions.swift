//
//  Extensions.swift
//  NetflixClone
//
//  Created by Noureddine Legragui on 14/4/2022.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
    }
}
