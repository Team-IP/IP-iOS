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
                
                let detailCount = surveyResponse.result.surveyList.map { $0.surveyId }
                // nested
                var detailContents = [String]()
                
                for (index, id) in detailCount.enumerated() {
                    let detailURL = baseURL + "/ip/detail" // Replace with actual detail endpoint
                    let dataTaskDetail = AF.request(
                        detailURL,
                        method: .get,
                        parameters: ["surveyId": id],
                        headers: headers
                    ).serializingDecodable(SurveyDetailResponseDTO.self)
                    
                    let responseDetail = await dataTaskDetail.response
                    
                    switch responseDetail.result {
                    case .success(let surveyDetailResponse):
                        if surveyDetailResponse.isSuccess {
                            detailContents.append( surveyDetailResponse.result.content ?? ""
                           )
                        } else {
                            let error = NSError(domain: "", code: surveyDetailResponse.code, userInfo: [NSLocalizedDescriptionKey: surveyDetailResponse.message])
                            throw error
                        }
                    case .failure(let error):
                        throw error
                    }
                }
                
                let newSurvey = surveyResponse.result.surveyList
                let newSurveyDetail = newSurvey.enumerated().map { (index, survey) in
                    return IfCategoryDTO(
                        surveyId: survey.surveyId,
                        title: survey.title,
                        firstOption: survey.firstOption,
                        secondOption: survey.secondOption,
                        ipAmount: survey.ipAmount,
                        prize: survey.prize,
                        endAt: survey.endAt,
                        voteCount: survey.voteCount,
                        content: detailContents[index],
                        category: survey.category,
                        ip: survey.ip
                    )
                }
            
                return newSurveyDetail
            } else {
                let error = NSError(domain: "", code: surveyResponse.code, userInfo: [NSLocalizedDescriptionKey: surveyResponse.message])
                throw error
            }
        case .failure(let error):
            throw error
        }
    }
}
