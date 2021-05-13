//
//  WPResponseHandlingError.swift
//  WPModuleNetwork
//
//  Created by AhnSangHoon on 2021/05/10.
//

import Foundation

/// Response를 Handling하는 과정에서 발생하는 Error
public struct WPResponseHandlingError {
    private let errorCase: WPResponseHandling
    private let message: String
    
    public init(_ errorCase: WPResponseHandling, _ message: String = "") {
        self.errorCase = errorCase
        self.message = message
    }
    
    var errorMessage: String {
        switch errorCase {
        case .decode:
            fallthrough
        case .jsonSerialization:
            return errorCase.description + message
        }
    }
}

/// Response를 Handling하는 과정에서 발생할 수 있는 Error Case
public enum WPResponseHandling {
    /// # decode중 발생하는 에러
    case decode
    /// # jsonSerialization중 발생하는 에러
    case jsonSerialization
    
    var description: String {
        switch self {
        case .decode:
            return "Decode"
        case .jsonSerialization:
            return "JsonSerialization"
        }
    }
}
