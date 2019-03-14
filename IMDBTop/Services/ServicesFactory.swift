//
//  ServicesFactory.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya

class ServicesFactory {
    static let shared = ServicesFactory()
    
    private init() { }
    
    private var _commonService: CommonServiceProtocol?
    var commonService: CommonServiceProtocol {
        if let instance = _commonService {
            return instance
        }
        
        let provider = MoyaProvider<CommonAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
        let newInstance = CommonService(provider: provider)
        _commonService = newInstance
        return newInstance
    }
    
    var movieService: MovieServiceProtocol {
        let provider = MoyaProvider<MovieAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
        return MovieService(provider: provider)
    }
}
