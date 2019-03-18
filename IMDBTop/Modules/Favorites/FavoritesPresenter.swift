//
//  FavoritesPresenter.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class FavoritesPresenter: FavoritesPresenterProtocol {
    private var interactor: FavoritesInteractorProtocol
    private var router: FavoritesRouterProtocol
    weak var view: FavoritesViewProtocol!
    
    init(view: FavoritesViewProtocol, interactor: FavoritesInteractorProtocol, router: FavoritesRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchFavorites()
    }
    
    func present(favorites: [Movie]) {
        view.show(favorites: favorites)
    }
}
