//
//  MovieViewController.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import RxSwift

class MovieViewController: UIViewController, MovieViewProtocol {
    var presenter: MoviePresenterProtocol!
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        
    }
    
    func show(movie: Movie) {
        imageView.setImage(withPath: movie.posterPath).disposed(by: bag)
        
        titleLabel.text = movie.title
        ratingLabel.text = "Rating \(movie.votePresent)"
        descriptionLabel.text = movie.overview
    }
}

private extension Movie {
    var votePresent: String {
        return String(describing: voteAverage ?? 0)
    }
}
