//
//  HomeService.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//


import Foundation
import Alamofire



enum HomeError: Error {
    case decodeFailed
    case requestFailed
}

class HomeService {
    static let shared = HomeService()
    
    private let baseURL = "http://3.38.2.96"
    private let path = "/ip/list"
    private let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWF0IjoxNzE3MjY2NTQ4LCJleHAiOjE3MTg3Mzc3Nzd9.cmA-53JHFKN5XPctAaDBP5DjZJcZJZp6etBoyEHYNvk"
        ]
    private init() { }
    
    func fetchSurveys(completion: @escaping (Swift.Result<[VoteModel], HomeError>) -> Void) {
        let url = baseURL + path
        print("HomeService fetchSurveys")
        
        let parameter : [String: Any] = [
            "pageNumber" : 0
        ]
        
        AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default ,headers: headers).validate().responseDecodable(of: SurveyResponse.self) { response in
            print(response)
            switch response.result {
            case .success(let surveyResponse):
                if surveyResponse.isSuccess {
                    completion(.success(surveyResponse.result))
                    print("success")
                } else {
                    completion(.failure(.requestFailed))
                    print("failure")
                }
            case .failure:
                completion(.failure(.decodeFailed))
            }
        }
    }
}
