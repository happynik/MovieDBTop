//
//  FavoritesInteractor.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class FavoritesInteractor: FavoritesInteractorProtocol {
    weak var presenter: FavoritesPresenterProtocol!
    
    private let bag = DisposeBag()
    private var favoritesService: FavoritesServiceProtocol
    
    init(favoritesService: FavoritesServiceProtocol) {
        self.favoritesService = favoritesService
    }
    
    func fetchFavorites() {
        favoritesService.allFavorites()
            .subscribe(onSuccess: { [weak self] favorites in
                self?.presenter.present(favorites: favorites)
            }).disposed(by: bag)
    }
}
