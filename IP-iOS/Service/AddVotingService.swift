//
//  AddVotingService.swift
//  IP-iOS
//
//  Created by 이승민 on 6/2/24.
//

import Alamofire

struct AddVotingRequestDto: Codable {
    let title, content, firstOption, secondOption, endAt, category: String
    let ipAmount: Int
}

final class AddVotingService {
    
    static let shared = AddVotingService()
    
    private let baseURL = "http://3.38.2.96"
    
    private let headers: HTTPHeaders = [
        "Authorization": "Bearer eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWF0IjoxNzE3MjY2NTQ4LCJleHAiOjE3MTg3Mzc3Nzd9.cmA-53JHFKN5XPctAaDBP5DjZJcZJZp6etBoyEHYNvk"
    ]
    
    private init() {}
    
    // MARK: - 투표 생성
    func postPurchase(parameters: AddVotingRequestDto,
                      completion: @escaping (Error?) -> Void) {
        
        AF.request("\(baseURL)/survey",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
        .validate(statusCode: 200..<300)
        .response { response in
            switch response.result {
            case .success:
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
