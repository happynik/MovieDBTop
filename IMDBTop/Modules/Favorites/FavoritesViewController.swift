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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        tableView.delegate = self
    }
}

extension FavoritesViewController: UITableViewDelegate {
    
}
