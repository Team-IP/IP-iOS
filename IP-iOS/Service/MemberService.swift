//
//  SignupService.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import Foundation
import Alamofire

struct SignupRequestDTO: Codable {
    let name: String
    let email: String
    let password: String
}

enum SignupError: Error {
    case decodeFailed
}

class MemberService {
    let baseURL = "http://3.38.2.96"
    let path = "/signup"
    
    static let shared = MemberService()
    private init() { }
    
    func signup(
        name: String,
        email: String,
        password: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        let url = baseURL + path
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
                    if let data = data, let responseString = String(data: data, encoding: .utf8) {
                        completion(.success(responseString))
                    } else {
                        completion(.failure(SignupError.decodeFailed))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
