//
//  TestProvider.swift
//  WPNetworkModuleExample
//
//  Created by onemoonStudio on 2020/01/22.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation
import Moya
import WPModuleNetwork

class TestProvider: WPNetworkProvider {
    let provider = MoyaProvider<TestTarget>()

    func testHeaders() {
        provider.request(.headertest) { result in
            switch result {
            case .success(let response):
                print("good")
                print(String(data: response.data, encoding: .utf8))
            case .failure(let error):
                print("moya Error !")
            }
        }
    }

}
