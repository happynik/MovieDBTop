//
//  MovieInteractor.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

class MovieInteractor: MovieInteractorProtocol {
    weak var presenter: MoviePresenterProtocol!
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
