//
//  IfCategoryDTO.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import Foundation

// 전체 응답 구조
struct IfCategoryResponseDTO: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: IfCategoryResultDTO
}

// 결과 구조체
struct IfCategoryResultDTO: Codable {
    let listSize: Int
    let totalPage: Int
    let totalElements: Int
    let isLast: Bool
    let surveyList: [IfCategoryDTO]
}

// 각각의 설문 항목
struct IfCategoryDTO: Codable, Identifiable, Equatable {
    var id: Int {
        return surveyId
    }
    let surveyId: Int
    let title: String
    let firstOption: String
    let secondOption: String
    let ipAmount: Int?
    let prize: String?
    let endAt: String
    let voteCount: Int
    let category: String
    let ip: Bool
}
