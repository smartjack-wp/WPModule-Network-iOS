//
//  TestTarget.swift
//  WPNetworkModuleExample
//
//  Created by onemoonStudio on 2020/01/22.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation
import Moya
import WPModuleNetwork

enum TestTarget: WPNetworkTarget {
    case headertest
}

extension TestTarget {
    var headers: [String : String]? {
        return ["hello": "world"]
    }
    
    var baseURL: URL {
        return URL(string: "https://postman-echo.com")!
    }
    
    var method: Moya.Method {
        switch self {
        case .headertest:
            return .get
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var path: String {
        switch self {
        case .headertest:
            return "/headers"
        }
    }
}
