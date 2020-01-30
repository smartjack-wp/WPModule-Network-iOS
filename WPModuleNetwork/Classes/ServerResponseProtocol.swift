//
//  ServerResponseProtocol.swift
//  WPNetworkModule
//
//  Created by Hyeontae on 2020/01/21.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation

/// ServerResponse에 항상 포함되는 값에 대한 protocol
/// WPNetworkProvider.swift 에서 서버 응답의 유효성 검사를 하기 위해서 사용됨
public protocol ServerResponseProtocol {
    /// apiResultCode는 성공일 경우 0, 제대로 작동하지 않은 경우 다른 값이다. 이 경우 badRequest Error를 보내준다.
    var apiResultCode: Int { get }
    /// 제대로 작동하지 않은 경우에 이유를 말해주는 property
    var resultMessage: String { get }
}

