//
//  CommonService.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol CommonServiceProtocol {
    func ImagesConfig() -> Single<Configuration.Images?>
}

class CommonService: CommonServiceProtocol {
    private var provider: MoyaProvider<CommonAPI>
    
    private var cachedConfigObservable: Single<Configuration.Images?>?
    private var lastConfigImages: Configuration.Images?
    
    init(provider: MoyaProvider<CommonAPI>) {
        self.provider = provider
    }
    
    func ImagesConfig() -> Single<Configuration.Images?> {
        if let cachedObservable = cachedConfigObservable {
            return cachedObservable
        }
        if let configImages = lastConfigImages {
            return .just(configImages)
        }
        let configObservable = provider.rx.request(.configuration)
            .parse(Configuration.Response.self)
            .do(onSuccess: { [weak self] response in
                self?.lastConfigImages = response.images
                self?.cachedConfigObservable = nil
            }).map { $0.images }
            .asObservable().share().asSingle()
        cachedConfigObservable = configObservable
        return configObservable
    }
}
