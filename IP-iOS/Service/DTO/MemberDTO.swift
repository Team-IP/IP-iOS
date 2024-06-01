//
//  MemberDTO.swift
//  IP-iOS
//
//  Created by DOYEON LEE on 6/2/24.
//

import Foundation

struct SignupRequestDTO: Codable {
    let name: String
    let email: String
    let password: String
}

struct LoginRequestDTO: Codable {
    let email: String
    let password: String
}

// 전체 응답 구조
struct LoginResponseDTO: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: LoginResultDTO
}

// 결과 구조체
struct LoginResultDTO: Codable {
    let token: String
    let title: String?
    let ipAmount: Int?
}

struct MarketResponseDTO: Codable {
    let ipAmount: Int
    let usedIpAmount: Int
}
