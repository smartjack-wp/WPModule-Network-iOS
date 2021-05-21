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
    /// Http Status에 따른 Error
    case httpStatus(error: WPHttpStatusError)
    /// 응답 처리중 발생하는 Error
    case responseHandling(error: WPResponseHandlingError)
    /// 서버에서 응답 코드가 0이 아닌 코드 Error
    case server(_ code: Int, _ message: String)
    /// 명시되지 않은 Error의 임시 처리를 위한 Error
    case other(_ errorMessage: String = "")
    
    /// 개발자가 확인하는 메세지
    public var errorDescription: String {
        switch self {
        case .httpStatus(let error):
            return error.errorMessage
        case .responseHandling(let error):
            return error.errorMessage
        case .server(let code, let message):
            return "\(code)" + message
        case .other(let message):
            return message
        }
    }
    
    /// 유저에게 전달할 메세지
    ///
    /// 메세지 변경이 필요한 경우에는 로컬 프로젝트에 동일한 프로퍼티를 선언하여 사용한다.
    public var errorMessageForUser: String {
        return "요청에 실패하였습니다. 네트워크를 확인해주세요."
    }
}
