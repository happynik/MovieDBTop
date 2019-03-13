//
//  MoviesService.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol MovieServiceProtocol {
    func topRated() -> Single<[Movie]>
}

class MovieService: MovieServiceProtocol {
    private var provider: MoyaProvider<MovieAPI>
    
    init(provider: MoyaProvider<MovieAPI>) {
        self.provider = provider
    }
    
    // TODO: need pagination
    func topRated() -> Single<[Movie]> {
        let params = MovieAPI.QueryParameters()
        return provider.rx.request(.topRated(queryParameters: params)).map([Movie].self)
//        return .never()
//        provider.rx
    }
}
