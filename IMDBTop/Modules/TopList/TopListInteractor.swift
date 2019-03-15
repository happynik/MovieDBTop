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
    
    private var currentPage: Int?
    private var nextPage: Int? {
        return currentPage.flatMap { $0 + 1 }
    }
    
    init(moviesService: MovieServiceProtocol) {
        self.moviesService = moviesService
    }
    
    func fetchItems() {
        moviesService.topRated(with: nextPage)
            .subscribe(onSuccess: { [weak self] response in
                if let page = response.page {
                    self?.currentPage = page
                } else {
                    self?.currentPage = (self?.currentPage ?? 0) + 1
                }
                
                guard let movies = response.results else {
                    return
                }
                
                self?.presenter.present(items: movies)
            }, onError: { error in
                // TODO: show error
                print(error)
            }).disposed(by: bag)
    }
}
