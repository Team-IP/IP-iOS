//
//  IfCategoryService.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import Foundation
import Alamofire

class IfCategoryService {
    private let baseURL = "http://3.38.2.96"
    private let token = "Bearer eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjozLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWF0IjoxNzE3MjY2NTQ4LCJleHAiOjE3MTg3Mzc3Nzd9.cmA-53JHFKN5XPctAaDBP5DjZJcZJZp6etBoyEHYNvk"
    
    static let shared = IfCategoryService()
    private init() { }
    
    func fetch(
        category: String?,
        pageNumber: String
    ) async throws -> [IfCategoryDTO] {
        if let category = category {
            return try await fetchByCategory(category: category, pageNumber: pageNumber)
        } else {
            return try await fetchAll(pageNumber: pageNumber)
        }
    }
    
    private func fetchAll(
        pageNumber: String
    ) async throws -> [IfCategoryDTO] {
        let url = baseURL + "/ip/list"
        
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Content-Type": "application/json"
        ]
        
        let parameters: [String: String] = [
            "pageNumber": pageNumber
        ]
        
        let dataTask = AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        ).serializingDecodable(IfCategoryResponseDTO.self)
        
        let response = await dataTask.response
        
        switch response.result {
        case .success(let surveyResponse):
            print(surveyResponse)
            if surveyResponse.isSuccess {
                return surveyResponse.result.surveyList
            } else {
                let error = NSError(domain: "", code: surveyResponse.code, userInfo: [NSLocalizedDescriptionKey: surveyResponse.message])
                throw error
            }
        case .failure(let error):
            throw error
        }
    }
    
    private func fetchByCategory(
        category: String,
        pageNumber: String
    ) async throws -> [IfCategoryDTO] {
        let url = baseURL + "/ip/category/list"
        
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Content-Type": "application/json"
        ]
        
        let parameters: [String: String] = [
            "category": category,
            "pageNumber": pageNumber
        ]
        
        let dataTask = AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: headers
        ).serializingDecodable(IfCategoryResponseDTO.self)
        
        let response = await dataTask.response
        
        switch response.result {
        case .success(let surveyResponse):
            if surveyResponse.isSuccess {
                return surveyResponse.result.surveyList
            } else {
                let error = NSError(domain: "", code: surveyResponse.code, userInfo: [NSLocalizedDescriptionKey: surveyResponse.message])
                throw error
            }
        case .failure(let error):
            throw error
        }
    }
}
