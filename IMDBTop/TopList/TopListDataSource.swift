//
//  TopListDataSource.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import UIKit

class TopListDataSource: NSObject {
    fileprivate var items: [Cinema]
    
    init(items: [Cinema]) {
        self.items = items
    }
}

extension TopListDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CinemaCell.reuseIdentifier, for: indexPath)
        guard let cinemaCell = cell as? CinemaCell else {
            return cell
        }
        
        return cinemaCell.fill(from: items[indexPath.row])
    }
}

extension CinemaCell {
    func fill(from item: Cinema) -> Self {
        self.textLabel?.text = item.title
        return self
    }
}
