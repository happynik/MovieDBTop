//
//  TopListPresenter.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class TopListPresenter: TopListPresenterProtocol {
    private var interactor: TopListInteractorProtocol
    private var router: TopListRouterProtocol
    weak var view: TopListViewProtocol!
    
    init(view: TopListViewProtocol, interactor: TopListInteractorProtocol, router: TopListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func viewDidLoad() {
        view.show(loading: true)
        interactor.fetchItems()
    }
    
    func presentFavorites() {
        router.openFavorites()
    }
    
    func present(items: [Movie]) {
        view.show(loading: false)
        view.show(items: items)
    }
    
    func presentNewPage() {
        view.show(loading: true)
        interactor.fetchItems()
    }
    
    func present(movie: Movie) {
        router.open(movie: movie)
    }
}
