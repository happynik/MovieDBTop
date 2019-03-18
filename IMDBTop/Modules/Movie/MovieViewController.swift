//
//  MovieViewController.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import RxSwift

enum FavoriteButtonStyle {
    case add
    case remove
}

class MovieViewController: UIViewController, MovieViewProtocol {
    var presenter: MoviePresenterProtocol!
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let bag = DisposeBag()
    private var addToFavoriteButton: UIBarButtonItem?
    private var removeFromFavoriteButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        addToFavoriteButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addToFavoriteTap))
        
        removeFromFavoriteButton = UIBarButtonItem(title: "Remove", style: .done, target: self, action: #selector(removeFromFavoriteTap))
        removeFromFavoriteButton?.tintColor = .red
    }
    
    func show(movie: Movie) {
        imageView.setImage(withPath: movie.posterPath).disposed(by: bag)
        
        titleLabel.text = movie.title
        ratingLabel.text = "Rating \(movie.votePresent)"
        descriptionLabel.text = movie.overview
    }
    
    func showButton(with style: FavoriteButtonStyle) {
        navigationItem.rightBarButtonItem = style == .add ? addToFavoriteButton : removeFromFavoriteButton
    }
    
    @objc private func addToFavoriteTap() {
        presenter.addToFavorites()
    }
    
    @objc private func removeFromFavoriteTap() {
        presenter.removeFromFavorites()
    }
}

private extension Movie {
    var votePresent: String {
        return String(describing: voteAverage ?? 0)
    }
}
