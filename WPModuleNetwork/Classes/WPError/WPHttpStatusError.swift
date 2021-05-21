//
//  WPHttpStatusError.swift
//  WPModuleNetwork
//
//  Created by AhnSangHoon on 2021/05/10.
//

import Foundation

/// Http Status 에 따른 Error
public struct WPHttpStatusError {
    public let code: Int
    public let status: WPHttpStatus
    
    init(_ code: Int, _ status: WPHttpStatus) {
        self.code = code
        self.status = status
    }
    
    var errorMessage: String {
        return "\(code): " + status.description
    }
}

/// Http Status Code에 따른 Status Case
public enum WPHttpStatus {
    /// 100 - 199 사이의 100 번대 Status
    case conditionalResponse
    /// 200 - 299 사이의 200 번대 Status
    case success
    /// 300 - 399 사이의 300 번대 Status
    case redirection
    /// 400 - 499 사이의 400 번대 Status
    case badRequestError
    /// 500 - 599 사이의 500 번대 Status
    case serverSideError
    /// 명시되지 않은 Status
    case other

    /// 각 case에 대한 description
    var description: String {
        switch self {
        case .conditionalResponse:
            return "ConditionalResponse"
        case .success:
            return "Success"
        case .redirection:
            return "Redirection"
        case .badRequestError:
            return "BadRequestError"
        case .serverSideError:
            return "ServerSideError"
        case .other:
            return "OtherHttpStatusError"
        }
    }

    static func get(from code: Int) -> WPHttpStatus {
        switch code {
        case 100..<200:
            return .conditionalResponse
        case 200..<300:
            return .success
        case 300..<400:
            return .redirection
        case 400..<500:
            return .badRequestError
        case ...500:
            return .serverSideError
        default:
            return .other
        }
    }
}
