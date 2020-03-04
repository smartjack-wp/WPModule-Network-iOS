//
//  WPNetworkProvider.swift
//  WPNetworkModule
//
//  Created by Hyeontae on 2020/01/21.
//  Copyright © 2020 Hyeon Tae Kim. All rights reserved.
//

import Foundation
import Moya

/// LabManager 에서 사용되는 공통적인 Provider Protocol 이며 공통적으로 사용되는 함수들을 정의
public protocol WPNetworkProvider {
    associatedtype WPTarget: WPNetworkTarget
    typealias NetworkError = WPNetworkError
    // 해당 프로토콜을 채택한 Provider 는 NetworkError 네이밍을 그대로 사용할 수 있다.
    typealias DecodableServerResponse = Decodable & ServerResponseProtocol
    
    /// request를 위한 provider
    /// # provider\<Target\>(plugins: self.networkActivityPlugin) 로 생성을 하자
    var provider: MoyaProvider<WPTarget> { get }
}

extension WPNetworkProvider {
    // MARK: - Common Property
    /// Provider 를 생성할 때 사용하는 Plugin
    public var networkActivityPlugin: PluginType {
        return NetworkActivityPlugin(networkActivityClosure: self.networkActivityClosure)
    }
    
    /// networkActivity 를 자동으로 on/off 하는 클로저
    /// # networkActivityPlugin에 사용되는 클로저이다.
    var networkActivityClosure: NetworkActivityPlugin.NetworkActivityClosure {
        let closure: NetworkActivityPlugin.NetworkActivityClosure = { change, _ in
            switch change {
            case .began:
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            case .ended:
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        return closure
    }
    
    // MARK: - Common Method
    /// 공통적인 result handling logic 을 처리해주는 Generic 함수
    /// - Parameters:
    ///   - result: provider.request 를 통해서 받은 result
    ///   - completion: 결과를 전달할 클로저
    public func resultHandler<T: DecodableServerResponse>(_ result: Result<Response, MoyaError>, completion: @escaping (Result<T, WPNetworkError>) -> Void) {
        switch result {
        case .success(let responseData):
            // 응답이 제대로 들어온 경우
            do {
                let dic = try JSONSerialization.jsonObject(with: responseData.data, options: []) as? [String : Any]
                if (dic?["code"] as? Int) == 0 {
                    let decodedData = try responseData.map(T.self)
                    if decodedData.apiResultCode == 0 { // 성공
                        completion(.success(decodedData))
                    } else { // bad request
                        print("api code => \(decodedData.apiResultCode)")
                        print("message => \(decodedData.resultMessage)")
                        completion(.failure(.badRequest(decodedData.resultMessage)))
                    }
                }else {
                    completion(.failure(.badRequest(dic?["msg"] as? String ?? "Network에서 Error가 발생하였습니다")))
                }
            } catch {
                // decoding 에 실패한 경우
                print(WPNetworkError.decodeErorr.errorDescription)
                print(String(data: responseData.data, encoding: .utf8) ?? "")
                completion(.failure(.decodeErorr))
            }
        case .failure(let moyaError):
            // 응답이 제대로 들어오지 않은 경우
            print(WPNetworkError.networkError(moyaError))
            completion(.failure(.networkError(moyaError)))
        }
    }
}

