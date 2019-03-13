//
//  TopListInteractor.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

class TopListInteractor: TopListInteractorProtocol {
    weak var presenter: TopListPresenterProtocol!
    
    func fetchItems() {
        // TODO: get top items
        presenter.present(items: [Movie(title: "Kapitan Marvel"), Movie(title: "Green Mile")])
    }
}
