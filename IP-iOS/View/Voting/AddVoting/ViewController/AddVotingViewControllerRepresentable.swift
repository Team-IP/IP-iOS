//
//  AddVotingViewControllerRepresentable.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/2/24.
//

import SwiftUI
import UIKit

// UIKit ViewController를 래핑하는 구조체
struct AddVotingViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> AddVotingViewController {
        return AddVotingViewController()
    }
    
    func updateUIViewController(_ uiViewController: AddVotingViewController, context: Context) {
        // 업데이트 로직이 필요할 경우 구현
    }
}
