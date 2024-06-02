//
//  AddVotingViewController.swift
//  IP-iOS
//
//  Created by 이승민 on 6/1/24.
//

import UIKit
import IQKeyboardManagerSwift
import SwiftUI

final class AddVotingViewController: UIViewController {
    // MARK: - Properties
    private var selectedButtonTag: Int?
    
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
        view.bettingTextField.inputAccessoryView = createToolbar()
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
        
        self.addVotingView.notEnoughAleartView.retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        self.addVotingView.notEnoughAleartView.goBuyButton.addTarget(self, action: #selector(goBuyButtonTapped), for: .touchUpInside)
    }
    
    @objc func retryButtonTapped() {
        addVotingView.overlayView.isHidden = true
        addVotingView.notEnoughAleartView.isHidden = true
    }
    
    @objc func goBuyButtonTapped() {
        print("구매하기 뷰로")
        let leafStorageView = LeafStorageView(path: .constant(NavigationPath()))
        let hostingController = UIHostingController(rootView: leafStorageView)
        if let navigationController = self.navigationController {
            print("닐 아님")
            navigationController.pushViewController(hostingController, animated: true)
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
        
        guard let title = addVotingView.titleTextField.text,
              let content = addVotingView.descriptionTextView.text,
              let firstOption = addVotingView.firstVotingItemTextField.text,
              let secondOption = addVotingView.secondVotingItemTextField.text,
              let endAt = addVotingView.deadLineTextField.text,
              let ipAmount = addVotingView.bettingTextField.text else { return }
        
        var isEmpty = false
        
        if title == "" {
            print("제목 20자 넘음 or 0글자")
            addVotingView.titleWarningLabel.textColor = .red
            isEmpty = true
        } else {
            addVotingView.titleWarningLabel.textColor = UIColor(red: 0.7804, green: 0.7804, blue: 0.7804, alpha: 1.0)
        }
        
        if endAt == "" {
            print("날짜 선택 안함")
            addVotingView.deadLineWarningLabel.textColor = .red
            isEmpty = true
        } else {
            addVotingView.deadLineWarningLabel.textColor = UIColor(red: 0.7804, green: 0.7804, blue: 0.7804, alpha: 1.0)
        }
        
        if ipAmount == "99999" {
            addVotingView.overlayView.isHidden = false
            addVotingView.notEnoughAleartView.isHidden = false
        }
        
        if isEmpty {
            return
        }
        
        guard let content = addVotingView.descriptionTextView.text, content != "",
              let firstOption = addVotingView.firstVotingItemTextField.text, firstOption != "",
              let secondOption = addVotingView.secondVotingItemTextField.text, secondOption != "",
              
                let ipAmount = addVotingView.bettingTextField.text, ipAmount != "" else {
            print("빈 칸 있음")
            return
        }
        
        guard let selectedButtonTag = self.selectedButtonTag else {
            print("카테고리 버튼 안눌름")
            return
        }
        
        var category = ""
        
        switch selectedButtonTag {
        case 0:
            category = "NONE"
        case 1:
            category = "ENTER"
        case 2:
            category = "ECONOMY"
        case 3:
            category = "SPORT"
        case 4:
            category = "DAILY"
        default:
            return
        }
        
        let parameters = AddVotingRequestDto(title: title,
                                             content: content,
                                             firstOption: firstOption,
                                             secondOption: secondOption,
                                             endAt: endAt,
                                             category: category,
                                             ipAmount: Int(ipAmount) ?? 0)
        
        print(parameters)
        
        AddVotingService.shared.postPurchase(parameters: parameters) { error in
            if let error = error {
                print("투표 생성 실패: \(error.localizedDescription)")
            } else {
                print("투표 생성 성공")
            }
        }
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
        // 이전에 선택된 버튼의 이미지를 clear로 설정
        if let previousTag = selectedButtonTag, let previousButton = view.viewWithTag(previousTag) as? UIButton {
            previousButton.setImage(UIImage(named: "ic_\(buttonName(for: previousTag))_clear"), for: .normal)
        }
        
        // 현재 선택된 버튼의 태그 업데이트
        selectedButtonTag = sender.tag
        
        // 모든 버튼의 이미지를 clear로 설정
        for button in addVotingView.categoryView.subviews where button is UIButton {
            if let button = button as? UIButton {
                button.setImage(UIImage(named: "ic_\(buttonName(for: button.tag))_clear"), for: .normal)
            }
        }
        
        // 선택된 버튼의 이미지를 full로 설정
        sender.setImage(UIImage(named: "ic_\(buttonName(for: sender.tag))_full"), for: .normal)
        
        print("Selected button tag: \(selectedButtonTag ?? -1)")
    }
    
    private func buttonName(for tag: Int) -> String {
        switch tag {
        case 0:
            return "all"
        case 1:
            return "love"
        case 2:
            return "economy"
        case 3:
            return "sports"
        case 4:
            return "daily"
        default:
            return ""
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        addVotingView.descriptionTextCountLabel.text = "(\(changedText.count)/300)"
        return changedText.count <= 300
    }
}
