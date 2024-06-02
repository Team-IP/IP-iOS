//
//  SignupService.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import Foundation
import Alamofire

enum MemberError: Error {
    case decodeFailed
}

final class MemberService {
    private let baseURL = "http://3.38.2.96"
    private let token = "Bearer eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWF0IjoxNzE3MjY2NTQ4LCJleHAiOjE3MTg3Mzc3Nzd9.cmA-53JHFKN5XPctAaDBP5DjZJcZJZp6etBoyEHYNvk"
    
    static let shared = MemberService()
    private init() { }
    
    func signup(
        name: String,
        email: String,
        password: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        let url = baseURL + "/signup"
        let parameters = SignupRequestDTO(
            name: name,
            email: email,
            password: password
        )
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(parameters)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            
            AF.request(url,
                       method: .post,
                       parameters: json as? [String: Any],
                       encoding: JSONEncoding.default
            )
            .response { response in
                switch response.result {
                case .success(let data):
                    completion(.success("success"))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginResponseDTO, Error>) -> Void
    ) {
        let url = baseURL + "/signin"
        let parameters = LoginRequestDTO(
            email: email,
            password: password
        )
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(parameters)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            
            AF.request(url,
                       method: .post,
                       parameters: json as? [String: Any],
                       encoding: JSONEncoding.default)
            .response { response in
                switch response.result {
                case .success(let data):
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let loginResponse = try decoder.decode(LoginResponseDTO.self, from: data)
                            completion(.success(loginResponse))
                        } catch {
                            completion(.failure(MemberError.decodeFailed))
                        }
                    } else {
                        completion(.failure(MemberError.decodeFailed))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func fetchMarketInfo(
        completion: @escaping (Result<MarketResponseDTO, Error>
        ) -> Void) {
        let url = baseURL + "/mypage/market"
        
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .get, headers: headers)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let marketResponse = try decoder.decode(MarketResponseDTO.self, from: data)
                        completion(.success(marketResponse))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
