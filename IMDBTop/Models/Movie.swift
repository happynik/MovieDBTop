//
//  Movie.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: Date?
    var genreIds: [Int]?
    var id: String?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdropPath: String?
    var popularity: Float?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Float?
}
