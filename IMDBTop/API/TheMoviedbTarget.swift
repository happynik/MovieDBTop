//
//  TheMoviedbAPI.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya

private let API_KEY = "4cf368db1fb4aebc845e74235871bf1c"

protocol TheMoviedbTarget: TargetType {
    var basePath: String { get }
    var queryParameters: [String: String] { get }
}

extension TheMoviedbTarget {
    var basePath: String {
        return "/"
    }
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3\(basePath)")!
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var commonQueryParameters: [String: String] {
        return ["api_key": API_KEY]
    }
}
