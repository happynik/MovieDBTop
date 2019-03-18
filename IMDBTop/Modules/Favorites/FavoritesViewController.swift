//
//  FavoritesViewController.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 15/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, FavoritesViewProtocol {
    var presenter: FavoritesPresenterProtocol!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: TopListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        tableView.register(UINib(nibName: CinemaCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CinemaCell.reuseIdentifier)
        tableView.delegate = self
    }
    
    func show(favorites: [Movie]) {
        dataSource = TopListDataSource(items: favorites)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate {
    
}
