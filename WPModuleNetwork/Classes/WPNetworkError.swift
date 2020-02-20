//
//  WPNetworkError.swift
//  WPNetworkModule
//
//  Created by Hyeontae on 2020/01/21.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation

/// LabManager에서 사용되는 Network Error 정의 errorDescription 을 통해서 어떤 종류의 error 인지 확인하기 쉽다.
public enum WPNetworkError: Error {
    case decodeErorr
    case badRequest(_ serverMessage: String)
    case networkError(_ error: Error)
    case simpleError(_ errorMessage: String = "")
    
    /// 개발자가 확인하는 메세지
    public var errorDescription: String {
        switch self {
        case .decodeErorr:
            return "Type이 맞지 않아 decoding에 실패 하였습니다."
        case .badRequest(let serverMessage):
            return serverMessage
        case .networkError(let error):
            return """
            Network Erorr 가 발생하였습니다. Error log 를 확인해주세요.
            \(error.localizedDescription ?? "description is nil")
            """
        case .simpleError(let message):
            return message
        }
    }
    
    /// 유저에게 전달할 메세지
    public var errorMessageForUser: String {
        switch self {
        case .badRequest(let messageFromServer):
            return messageFromServer
        default:
            return "요청에 실패하였습니다. 네트워크를 확인해주세요."
        }
    }
}

