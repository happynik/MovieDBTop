//
//  RealmModels.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RealmSwift

class MovieObject: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var posterUrl: String? = ""
    @objc dynamic var title: String? = ""
    @objc dynamic var releaseDate: Date? = Date()
    @objc dynamic var voteAverage: Float = 0
    @objc dynamic var overview: String? = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func fill(from movie: Movie) -> Self {
        self.id = String(describing: movie.id ?? 0)
        self.posterUrl = movie.posterPath
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.voteAverage = movie.voteAverage ?? 0.0
        self.overview = movie.overview
        return self
    }
}
