//
//  TopListRouter.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class TopListRouter: TopListRouterProtocol {
    weak var view: UIViewController!
    
    func openFavorites() {
        let favorites = FavoritesAssembly().build()
        view.navigationController?.pushViewController(favorites, animated: true)
    }
    
    func open(movie: Movie) {
        let movie = MovieAssembly().build(with: movie)
        view.navigationController?.pushViewController(movie, animated: true)
    }
}
