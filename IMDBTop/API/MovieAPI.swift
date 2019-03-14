//
//  MovieAPI.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    struct QueryParameters: Codable {
        var language: String?
        var page: Int?
        var region: String?
        
        init(language: String? = nil, page: Int? = nil, region: String? = nil) {
            self.language = language
            self.page = page
            self.region = region
        }
    }
    case topRated(queryParameters: QueryParameters)
}

extension MovieAPI: TheMoviedbTarget {
    var basePath: String {
        return "movie/"
    }
    
    var path: String {
        switch self {
        case .topRated: return "top_rated"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .topRated: return .get
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var queryAdditionalParameters: Encodable? {
        switch self {
        case let .topRated(params): return params
        }
    }
    
    var task: Task {
        switch self {
        case .topRated: return .requestParameters(parameters: queryParameters, encoding: URLEncoding.queryString)
        }
    }
}

extension Encodable {
    func asDictionary() -> [String: String]? {
        return (try? JSONEncoder().encode(self))
            .flatMap { try? JSONSerialization.jsonObject(with: $0, options: []) }
            .flatMap { $0 as? [String : String] }
    }
}
