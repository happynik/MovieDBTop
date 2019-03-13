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
    
}
