//
//  TopRated.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

enum TopRated {
    struct Response: Codable {
        var page: Int?
        var result: [Movie]?
        var totalResults: Int?
        var totalPages: Int?
    }
}
