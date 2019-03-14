//
//  CommonAPI.swift
//  IMDBTop
//
//  Created by Камилла Бадаева on 13/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import Moya

enum CommonAPI {
    case configuration
}

extension CommonAPI: TheMoviedbTarget {
    var queryParameters: [String : String] {
        return commonQueryParameters
    }
    
    var path: String {
        switch self {
        case .configuration: return "/configuration"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .configuration: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .configuration: return .requestPlain
        }
    }
}
