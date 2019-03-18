//
//  MovieInteractor.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class MovieInteractor: MovieInteractorProtocol {
    weak var presenter: MoviePresenterProtocol!
    
    let bag = DisposeBag()
    var favoritesService: FavoritesServiceProtocol
    var movie: Movie
    
    init(movie: Movie, favoritesService: FavoritesServiceProtocol) {
        self.movie = movie
        self.favoritesService = favoritesService
    }
    
    func fetchFavorite() {
        favoritesService.contains(movie: movie)
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else {
                    return
                }
                result ? self.presenter.presentRemoveButton() : self.presenter.presentAddButton()
            }).disposed(by: bag)
    }
    
    func AddToFavorites() {
        favoritesService.add(movie: movie)
            .subscribe({ [weak self] _ in
                self?.presenter.presentRemoveButton()
            }).disposed(by: bag)
    }
    
    func removeFromFavorites() {
        favoritesService.remove(movie: movie)
            .subscribe(onSuccess: { [weak self] _ in
                self?.presenter.presentAddButton()
            }).disposed(by: bag)
    }
}
