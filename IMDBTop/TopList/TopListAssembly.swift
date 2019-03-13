//
//  TopListAssembly.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class TopListAssembly {
    
    func build() -> UIViewController {
        let view = TopListViewController()
        let interactor = TopListInteractor()
        let router = TopListRouter()
        let presenter = TopListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
