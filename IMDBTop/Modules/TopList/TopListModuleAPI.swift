//
//  TopListModuleAPI.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

//MARK: - View
protocol TopListViewProtocol: class {
    func show(items: [Movie])
    func show(loading: Bool)
}

//MARK: - Presenter
protocol TopListPresenterProtocol: class {
    func viewDidLoad()
    func presentFavorites()
    func present(items: [Movie])
    func presentNewPage()
    func present(movie: Movie)
}

//MARK: - Interactor
protocol TopListInteractorProtocol: class {
    func fetchItems()
}

//MARK: - Router
protocol TopListRouterProtocol: class {
    func open(movie: Movie)
    func openFavorites()
}
