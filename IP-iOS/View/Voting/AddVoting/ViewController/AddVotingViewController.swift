//
//  AddVotingViewController.swift
//  IP-iOS
//
//  Created by 이승민 on 6/1/24.
//

import UIKit

final class AddVotingViewController: UIViewController {
    // MARK: - Properties
    private let addVotingView = AddVotingView()
    
    // MARK: - View 설정
    override func loadView() {
        view = addVotingView
    }
    
    // MARK: - ViewDidLodad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepare()
    }
    
    private func prepare() {
        
    }
}
