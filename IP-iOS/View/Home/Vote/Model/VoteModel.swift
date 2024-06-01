//
//  VoteModel.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import Foundation

// Response 모델
struct SurveyResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [VoteModel]
}

// Survey 모델
struct VoteModel: Codable {
    let surveyId: Int
    let title: String
    let firstOption: String
    let secondOption: String
    let ipAmount: Int
    let prize: String
    let endAt: String
    let voteCount: Int
    let category: String
    let ip: Bool
}
