//
//  CinemaCell.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import RxSwift

class CinemaCell: UITableViewCell {
    static let reuseIdentifier = "CinemaCell"
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let bag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        
        ratingLabel.text = nil
        ratingLabel.isHidden = false
        
        descriptionLabel.text = nil
        descriptionLabel.isHidden = false
    }
}
