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
import RxRealm

protocol FavoritesServiceProtocol {
    func allFavorites() -> Single<[Movie]>
    func contains(movie: Movie) -> Single<Bool>
    func add(movie: Movie) -> Single<Void>
    func remove(movie: Movie) -> Single<Void>
}

enum FavoritesError: Error {
    case all
    case add
    case remove
}

class FavoritesService: FavoritesServiceProtocol {
    private var moviesObservable: Single<Void>?
    
    func allFavorites() -> Single<[Movie]> {
        guard let realm = try? Realm() else {
            return .error(FavoritesError.all)
        }
        // TODO: add async
        let movies: [Movie] = realm.objects(MovieObject.self).map { Movie(object: $0) }
        return .just(movies)
    }
    
    func contains(movie: Movie) -> Single<Bool> {
        guard let realm = try? Realm() else {
            return .error(FavoritesError.add)
        }
        let containsResult = movieObject(for: movie, in: realm) != nil
        return .just(containsResult)
    }
    
    func add(movie: Movie) -> Single<Void> {
        guard let realm = try? Realm() else {
            return .error(FavoritesError.add)
        }
        do {
            try realm.write {
                realm.add(MovieObject().fill(from: movie))
            }
        } catch {
            return .error(FavoritesError.add)
        }
        
        // TODO: add async
        return .just(())
    }
    
    func remove(movie: Movie) -> Single<Void> {
        guard let realm = try? Realm() else {
            return .error(FavoritesError.remove)
        }
        guard let object = movieObject(for: movie, in: realm) else {
            return .just(())
        }
        
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            return .error(FavoritesError.remove)
        }
        return .just(())
    }
    
    private func movieObject(for movie: Movie, in realm: Realm) -> MovieObject? {
        return movie.id.flatMap({ realm.object(ofType: MovieObject.self, forPrimaryKey: String(describing: $0)) })
    }
}

private extension Movie {
    init(object: MovieObject) {
        self.id = Int(object.id)
        self.posterPath = object.posterUrl
        self.overview = object.overview
        self.releaseDate = object.releaseDate
        self.title = object.title
        self.voteAverage = object.voteAverage
        
        self.adult = nil
        self.genreIds = nil
        self.originalTitle = nil
        self.originalLanguage = nil
        self.backdropPath = nil
        self.popularity = nil
        self.voteCount = nil
        self.video = nil
    }
}
