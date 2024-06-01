//
//  AddVotingViewController.swift
//  IP-iOS
//
//  Created by 이승민 on 6/1/24.
//

import UIKit
import IQKeyboardManagerSwift

final class AddVotingViewController: UIViewController {
    // MARK: - Properties
    private let addVotingView = AddVotingView()
    
    // MARK: - View 설정
    override func loadView() {
        view = addVotingView
    }
    
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        setupTextView()
        setupButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        IQKeyboardManager.shared.enable = false
    }
}

extension AddVotingViewController {
    // 텍스트필드 설정
    private func setupTextField() {
        let view = self.addVotingView
        
        [view.titleTextField, 
         view.firstVotingItemTextField,
         view.secondVotingItemTextField,
         view.deadLineTextField,
         view.bettingTextField,
         view.categoryTextField].forEach { $0.delegate = self }
    }
    
    // 텍스트뷰 설정
    private func setupTextView() {
        self.addVotingView.descriptionTextView.delegate = self
    }
    
    // 버튼 설정
    private func setupButton() {
        self.addVotingView.uploadButton.addTarget(self,
                                                  action: #selector(uploadButtonTapped),
                                                  for: .touchUpInside)
    }
}

// MARK: - Actions
extension AddVotingViewController {
    @objc private func uploadButtonTapped() {
        print("업로드버튼 눌림")
    }
}

// MARK: - UITextFieldDelegate
extension AddVotingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // 리턴 키 누를 시 키보드 내림
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UITextViewDelegate
extension AddVotingViewController: UITextViewDelegate {
    
}
