//
//  TopListAssembly.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import Moya

class TopListAssembly {
    
    func build() -> UIViewController {
        let view = TopListViewController()
        let interactor = TopListInteractor(moviesService: MovieService(provider: MoyaProvider<MovieAPI>()))
        let router = TopListRouter()
        let presenter = TopListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
