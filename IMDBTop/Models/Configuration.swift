//
//  Configuration.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 14/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation

enum Configuration {
    struct Response: Codable {
        var images: Images?
        var changeKeys: [String]?
        
        enum CodingKeys: String, CodingKey {
            case images
            case changeKeys = "change_keys"
        }
    }
    
    struct Images: Codable {
        var baseUrl: String?
        var secureBaseUrl: String?
        var backdropSizes: [String]?
        var logoSizes: [String]?
        var posterSizes: [String]?
        var profileSizes: [String]?
        var stillSizes: [String]?

        enum CodingKeys: String, CodingKey {
            case baseUrl = "base_url"
            case secureBaseUrl = "secure_base_url"
            case backdropSizes = "backdrop_sizes"
            case logoSizes = "logo_sizes"
            case posterSizes = "poster_sizes"
            case profileSizes = "profile_sizes"
            case stillSizes = "still_sizes"
        }
    }
}
