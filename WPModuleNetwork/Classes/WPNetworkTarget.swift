//
//  WPNetworkTarget.swift
//  WPNetworkModule
//
//  Created by Hyeontae on 2020/01/21.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation
import Moya

/// LabManager 에 사용되는 Target에 대한 Protocol
/// # 공통적으로 사용되는 baseURL, baseToken, headers, sampleData 그리고 버전에 대한 정보를 설정
/// # 해당 프로토콜을 따르는 타겟들은 path, method, task 만 정의해도 사용할 수 있다.
public protocol WPNetworkTarget: TargetType { }

extension WPNetworkTarget {
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var sampleData: Data {
        return Data()
    }
    
}

