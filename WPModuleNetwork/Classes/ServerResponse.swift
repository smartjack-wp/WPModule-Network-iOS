//
//  ServerResponse.swift
//  WPNetworkModule
//
//  Created by Hyeontae on 2020/01/21.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation

/// Common Server Response
public struct ServerResponse: Decodable, ServerResponseProtocol {
    public let apiResultCode: Int
    public let resultMessage: String

    enum CodingKeys: String, CodingKey {
        case apiResultCode = "code"
        case resultMessage = "msg"
    }
}

/// Common Server Response With Data
public struct ServerResponseData<T>: Decodable, ServerResponseProtocol where T: Decodable {
    public let apiResultCode: Int
    public let resultMessage: String
    public let resultContents: T
    
    enum CodingKeys: String, CodingKey {
        case apiResultCode = "code"
        case resultMessage = "msg"
        case resultContents = "data"
    }
}

