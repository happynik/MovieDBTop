//
//  MovieModuleAPI.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

//MARK: - View
protocol MovieViewProtocol: class {
    func show(movie: Movie)
    func showButton(with style: FavoriteButtonStyle)
}

//MARK: - Presenter
protocol MoviePresenterProtocol: class {
    func viewDidLoad()
    func addToFavorites()
    func removeFromFavorites()
    func presentRemoveButton()
    func presentAddButton()
}

//MARK: - Interactor
protocol MovieInteractorProtocol: class {
    var movie: Movie { get set}
    func fetchFavorite()
    func AddToFavorites()
    func removeFromFavorites()
}

//MARK: - Router
protocol MovieRouterProtocol: class {
    
}
