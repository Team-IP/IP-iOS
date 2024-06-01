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
    
    @objc private func allButtonTapped() {
        print("전체버튼 클릭")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        IQKeyboardManager.shared.enable = false
        IQKeyboardManager.shared.enableAutoToolbar = true
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
        ].forEach { $0.delegate = self }
        
        setupDatePicker(for: view.deadLineTextField, datePicker: view.datePicker) // 날짜 피커뷰 설정
    }
    
    // 데이트 피커뷰
    private func setupDatePicker(for textField: UITextField, datePicker: UIDatePicker) {
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.calendar = Calendar(identifier: .gregorian)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self,
                             action: #selector(dateChanged(_:)),
                             for: .valueChanged)
        datePicker.minimumDate = Date() // 현재 날짜 이전은 선택 불가하게 설정
        
        textField.inputView = datePicker
        textField.inputAccessoryView = createToolbar()
    }
    
    // 텍스트뷰 설정
    private func setupTextView() {
        let tv = self.addVotingView.descriptionTextView
        tv.delegate = self
        tv.inputAccessoryView = createToolbar()
    }
    
    // 버튼 설정
    private func setupButton() {
        self.addVotingView.uploadButton.addTarget(self,
                                                  action: #selector(uploadButtonTapped),
                                                  for: .touchUpInside)
        let categorys = [
            addVotingView.categoryView.allButton,
            addVotingView.categoryView.loveButton,
            addVotingView.categoryView.economyButton,
            addVotingView.categoryView.sportsButton,
            addVotingView.categoryView.dailyButton
        ]
        
        categorys.forEach {
            $0.addTarget(self, action: #selector(categorysButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    // 툴바에 완료버튼 삽입
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "완료",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissPickerView))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }
}

// MARK: - Actions
extension AddVotingViewController {
    // 업로드 버튼
    @objc private func uploadButtonTapped() {
        print("업로드버튼 눌림")
    }
    
    // 데이트 피커뷰
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        addVotingView.deadLineTextField.text = formatter.string(from: sender.date)
    }
    
    // 데이트 피커뷰 완료버튼
    @objc private func dismissPickerView() {
        view.endEditing(true)
    }
    
    @objc private func categorysButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("전체 버튼 클릭")
            self.addVotingView.categoryView.allButton.setImage(UIImage(named: "ic_all_full"), for: .normal)
        case 1:
            print("사랑 버튼 클릭")
            self.addVotingView.categoryView.loveButton.setImage(UIImage(named: "ic_love_full"), for: .normal)
        case 2:
            print("경제 버튼 클릭")
            self.addVotingView.categoryView.economyButton.setImage(UIImage(named: "ic_economy_full"), for: .normal)
        case 3:
            print("스포츠 버튼 클릭")
            self.addVotingView.categoryView.sportsButton.setImage(UIImage(named: "ic_sports_full"), for: .normal)
        case 4:
            print("일상 버튼 클릭")
            self.addVotingView.categoryView.dailyButton.setImage(UIImage(named: "ic_daily_full"), for: .normal)
        default:
            break
        }
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
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "지금 무슨 상황인가요?!"
            textView.textColor = .placeholderText
        }
    }
}
