//
//  MovieModuleAPI.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

//MARK: - View
protocol MovieViewProtocol: class {
    func show(movie: Movie)
}

//MARK: - Presenter
protocol MoviePresenterProtocol: class {
    func viewDidLoad()
}

//MARK: - Interactor
protocol MovieInteractorProtocol: class {
    var movie: Movie { get set}
}

//MARK: - Router
protocol MovieRouterProtocol: class {
    
}
