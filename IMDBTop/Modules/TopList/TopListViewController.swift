//
//  TopListViewController.swift
//  IMDBTop
//
//  Created Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit

class TopListViewController: UIViewController, TopListViewProtocol {
    var presenter: TopListPresenterProtocol!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: TopListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        navigationItem.title = "Top List"
        
        tableView.register(UINib(nibName: CinemaCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CinemaCell.reuseIdentifier)
        tableView.delegate = self
    }
    
    // MARK: - TopListViewProtocol
    func show(items: [Movie]) {
        dataSource = TopListDataSource(items: items)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}

extension TopListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let movie = dataSource?.movie(at: indexPath.row) else {
            return
        }
        presenter.present(movie: movie)
    }
}
