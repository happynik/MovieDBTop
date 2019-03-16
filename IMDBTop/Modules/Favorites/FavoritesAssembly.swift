//
//  FavoritesAssembly.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class FavoritesAssembly {
    
    func build() -> UIViewController {
        let view = FavoritesViewController()
        let interactor = FavoritesInteractor(favoritesService: FavoritesService())
        let router = FavoritesRouter()
        let presenter = FavoritesPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
