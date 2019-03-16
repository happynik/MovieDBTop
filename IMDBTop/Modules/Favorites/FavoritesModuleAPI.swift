//
//  FavoritesModuleAPI.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

//MARK: - View
protocol FavoritesViewProtocol: class {
    
}

//MARK: - Presenter
protocol FavoritesPresenterProtocol: class {
    func viewDidLoad()
    func present(favorites: [FavoriteMovie])
}

//MARK: - Interactor
protocol FavoritesInteractorProtocol: class {
    func fetchFavorites()
}

//MARK: - Router
protocol FavoritesRouterProtocol: class {
    
}
