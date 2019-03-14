//
//  TopListInteractor.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class TopListInteractor: TopListInteractorProtocol {
    weak var presenter: TopListPresenterProtocol!
    
    private let bag = DisposeBag()
    private var moviesService: MovieServiceProtocol
    
    init(moviesService: MovieServiceProtocol) {
        self.moviesService = moviesService
    }
    
    func fetchItems() {
        moviesService.topRated()
            .subscribe(onSuccess: { [weak self] response in
                guard let movies = response.result else {
                    return
                }
                
                self?.presenter.present(items: movies)
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
}
