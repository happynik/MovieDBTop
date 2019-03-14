//
//  MoviePresenter.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class MoviePresenter: MoviePresenterProtocol {
    private var interactor: MovieInteractorProtocol
    private var router: MovieRouterProtocol
    weak var view: MovieViewProtocol!
    
    init(view: MovieViewProtocol, interactor: MovieInteractorProtocol, router: MovieRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
