//
//  FavoritesService.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

protocol FavoritesServiceProtocol {
    func allFavorites() -> Single<[FavoriteMovie]>
}

class FavoritesService: FavoritesServiceProtocol {
    func allFavorites() -> Single<[FavoriteMovie]> {
        return .never()
    }
}
