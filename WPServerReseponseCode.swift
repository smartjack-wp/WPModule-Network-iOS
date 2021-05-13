//
//  WPServerReseponseCode.swift
//  WPModuleNetwork
//
//  Created by AhnSangHoon on 2021/05/10.
//

import Foundation

/// Server Response Code에 따른 Error
public struct WPServerResponseError {
    public let code: WPServerReseponseCode
    public let message: String
    
    public init(_ code: WPServerReseponseCode, _ message: String) {
        self.code = code
        self.message = message
    }
}

/// Local Error Code가 채택해야하는 Server Response Code protocol
public protocol WPServerReseponseCode {
    /// 에러 발생에도 처리해야 하는 로직 유무를 판단하기 위해 사용한다.
    var continuousProcess: Bool { get }
    /// 에러 메세지를 사용자에게 노출 여부를 판단하기 위해 사용한다.
    var displayErrorMessageForUser: Bool { get }
}

/// # 테스트로 작성한 로컬 에러 코드
enum TestLocalErrorCode: Int, WPServerReseponseCode {
    case basic = 1000
    case dataBase = 1101
    case permissionDenied = 3106
    case other
    
    var continuousProcess: Bool {
        return false
    }

    var displayErrorMessageForUser: Bool {
        switch self {
        case .basic:
            return true
        case .dataBase:
            return true
        case .permissionDenied:
            return false
        case .other:
            return false
        }
    }
}
