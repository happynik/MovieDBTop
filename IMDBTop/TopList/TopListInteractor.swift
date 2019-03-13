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
        presenter.present(items: [Cinema(title: "Kapitan Marvel"), Cinema(title: "Green Mile")])
    }
}
