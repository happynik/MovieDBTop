//
//  MovieAssembly.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class MovieAssembly {
    
    func build() -> UIViewController {
        let view = MovieViewController()
        let interactor = MovieInteractor()
        let router = MovieRouter()
        let presenter = MoviePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
