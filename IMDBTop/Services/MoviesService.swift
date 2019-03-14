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
    func topRated() -> Single<TopRated.Response>
}

class MovieService: MovieServiceProtocol {
    private var provider: MoyaProvider<MovieAPI>
    
    init(provider: MoyaProvider<MovieAPI>) {
        self.provider = provider
    }
    
    // TODO: need pagination
    func topRated() -> Single<TopRated.Response> {
        let params = MovieAPI.QueryParameters()
        return provider.rx.request(.topRated(queryParameters: params)).parse(TopRated.Response.self)
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    public func parse<D: Decodable>(_ type: D.Type) -> Single<D> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return self.map(D.self, using: decoder)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}
