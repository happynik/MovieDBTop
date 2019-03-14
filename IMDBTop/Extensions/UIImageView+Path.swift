//
//  UIImageView+Path.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import RxSwift

extension UIImageView {
    func setImage(withPath path: String?) -> Disposable {
        // TODO: set placeholderImage
        return ServicesFactory.shared.commonService.ImagesConfig()
            .subscribe(onSuccess: { [weak self] config in
                guard
                    let path = path,
                    let baseUrl = config?.secureBaseUrl,
                    let fileSize = config?.posterSizes?.first,
                    let url = URL(string: "\(baseUrl)\(fileSize)\(path)") else {
                        return
                }
                self?.af_setImage(withURL: url)
            })
    }
}
