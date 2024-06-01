//
//  AddVotingView.swift
//  IP-iOS
//
//  Created by 이승민 on 6/1/24.
//

import UIKit
import Then
import SnapKit

final class AddVotingView: UIView {
    // MARK: - View
    lazy var datePicker = UIDatePicker()
    
    private lazy var scrollView = UIScrollView().then {
        $0.keyboardDismissMode = .onDrag // 스크롤 시 키보드 숨김
    }
    
    private lazy var contentView = UIView()
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "새 투표 생성하기"
        $0.font = .boldSystemFont(ofSize: 25)
    }
    
    // 로고 아이콘
    private lazy var logoIcon = UIImageView().then {
        $0.image = UIImage(systemName: "heart.fill")
        $0.tintColor = .orange
    }
    
    // 투표 제목
    private lazy var titleTextFieldView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    lazy var titleTextField = UITextField().then {
        $0.placeholder = "투표 제목을 입력해주세요"
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    private lazy var titleWarningLabel = UILabel().then {
        $0.text = "*20자 이내로 입력가능해요"
    }
    
    // 상황 설명
    lazy var descriptionTextView = UITextView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.textContainerInset = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 12.0, right: 16.0)
    }
    
    lazy var descriptionTextCountLabel = UILabel().then {
        $0.text = "0/300"
    }
    
    // 투표 항목
    private lazy var votingItemLabel = UILabel().then {
        $0.text = "투표 항목을 입력해주세요"
    }
    
    private lazy var firstVotingItemRoundView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    lazy var firstVotingItemTextField = UITextField().then {
        $0.placeholder = "첫번째 투표 항목을 입력해주세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    private lazy var secondVotingItemRoundView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    lazy var secondVotingItemTextField = UITextField().then {
        $0.placeholder = "두번째 투표 항목을 입력해주세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    // 투표 마감일
    private lazy var deadLineTextFieldView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
    }
    
    lazy var deadLineTextField = UITextField().then {
        $0.tintColor = .clear
        $0.placeholder = "투표 마감일을 설정해주세요"
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    // 베팅 잎
    private lazy var bettingTextFieldView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
    }
    
    lazy var bettingTextField = UITextField().then {
        $0.placeholder = "베팅 잎을 입력해주세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    lazy var bettingWarningLabel = UILabel().then {
        $0.text = "OOO님은 지금 🌿100잎을 가지고 있어요"
    }
    
    // 카테고리
    private lazy var categoryTextFieldView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
    }
    
    lazy var categoryTextField = UITextField().then {
        $0.placeholder = "카테고리를 선택해주세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    private lazy var categoryArrowIcon = UIImageView().then {
        $0.image = UIImage(systemName: "arrow.down")
    }
    
    // 업로드버튼
    lazy var uploadButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.setTitle("업로드하기", for: .normal)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        self.addSubviews([
            
            
            scrollView,
            uploadButton
        ])
        
        scrollView.addSubview(contentView) // 동적 스크롤뷰
        
        contentView.addSubviews([
            // 로고 아이콘
            logoIcon,
            
            // 새 투표 생성하기
            titleLabel,
            
            // 투표 제목
            titleTextFieldView,
            titleWarningLabel,
            
            // 상황 설명
            descriptionTextView,
            descriptionTextCountLabel,
            
            // 투표 항목
            votingItemLabel,
            firstVotingItemRoundView,
            secondVotingItemRoundView,
            
            // 투표 마감일
            deadLineTextFieldView,
            
            // 베팅 잎
            bettingTextFieldView,
            bettingWarningLabel,
            
            // 카테고리
            categoryTextFieldView
        ])
        
        titleTextFieldView.addSubview(titleTextField)
//        descriptionTextView.addSubview(descriptionTextCountLabel)
        firstVotingItemRoundView.addSubview(firstVotingItemTextField)
        secondVotingItemRoundView.addSubview(secondVotingItemTextField)
        deadLineTextFieldView.addSubview(deadLineTextField)
        bettingTextFieldView.addSubview(bettingTextField)
        categoryTextFieldView.addSubview(categoryTextField)
        categoryTextFieldView.addSubview(categoryArrowIcon)
    }
    
    private func configureConstraints() {
        
        
        
        
        // 스크롤뷰
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(uploadButton.snp.top).offset(-20)
        }
        
        // 동적 높이를 위한 컨텐트뷰
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        
        // 로고 아이콘
        logoIcon.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).inset(15)
        }
        
        // 새 투표 생성하기
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoIcon.snp.bottom).offset(20)
            make.leading.equalTo(logoIcon)
        }
        
        // 투표 제목
        titleTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView).inset(20)
            make.height.equalTo(50)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.edges.equalTo(titleTextFieldView).inset(5)
        }
        
        titleWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextFieldView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(titleTextFieldView)
        }
        
        // 상황 설명
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(titleWarningLabel).offset(40)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(150)
        }
        
        descriptionTextCountLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(descriptionTextView).inset(5)
        }
        
        // 투표 항목
        votingItemLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(titleTextFieldView)
        }
        
        firstVotingItemRoundView.snp.makeConstraints { make in
            make.top.equalTo(votingItemLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(50)
        }
        
        firstVotingItemTextField.snp.makeConstraints { make in
            make.edges.equalTo(firstVotingItemRoundView).inset(5)
        }
        
        secondVotingItemRoundView.snp.makeConstraints { make in
            make.top.equalTo(firstVotingItemRoundView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(50)
        }
        
        secondVotingItemTextField.snp.makeConstraints { make in
            make.edges.equalTo(secondVotingItemRoundView).inset(5)
        }
        
        // 투표 마감일
        deadLineTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(secondVotingItemRoundView.snp.bottom).offset(40)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(50)
        }
        
        deadLineTextField.snp.makeConstraints { make in
            make.edges.equalTo(deadLineTextFieldView).inset(5)
        }
        
        // 베팅 잎
        bettingTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(deadLineTextFieldView.snp.bottom).offset(40)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(50)
        }
        
        bettingTextField.snp.makeConstraints { make in
            make.edges.equalTo(bettingTextFieldView).inset(5)
        }
        
        bettingWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(bettingTextFieldView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(titleTextFieldView)
        }
        
        // 카테고리
        categoryTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(bettingWarningLabel.snp.bottom).offset(40)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(50)
            make.bottom.equalTo(contentView)
        }
        
        categoryTextField.snp.makeConstraints { make in
            make.edges.equalTo(categoryTextFieldView).inset(5)
        }
        
        categoryArrowIcon.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.centerY.equalTo(categoryTextFieldView)
            make.trailing.equalTo(categoryTextFieldView).inset(5)
        }
        
        // 업로드 버튼
        uploadButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(30)
        }
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
}

