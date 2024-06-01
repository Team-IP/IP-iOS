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
        $0.setDefaultFont(size: 22, weight: .bold)
    }
    
    // 로고 아이콘
    private lazy var logoIcon = UIImageView().then {
        $0.image = UIImage(named: "logo-color")
    }
    
    // 투표 제목
    private lazy var titleTextFieldView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.9098, green: 0.9098, blue: 0.9098, alpha: 1.0).cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    lazy var titleTextField = UITextField().then {
        $0.placeholder = "투표 제목을 입력해주세요"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    lazy var titleWarningLabel = UILabel().then {
        $0.text = "*20자 이내로 입력가능해주세요."
        $0.textColor = UIColor(red: 0.7804, green: 0.7804, blue: 0.7804, alpha: 1.0)
        $0.setDefaultFont(size: 10, weight: .regular)
    }
    
    // 상황 설명
    lazy var descriptionTextView = UITextView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.8941, blue: 0.8941, alpha: 1.0).cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.textContainerInset = UIEdgeInsets(top: 13.0, left: 17.0, bottom: 16.0, right: 23.0)
        
        $0.text = "지금 무슨 상황인가요?!"
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.textColor = .placeholderText
    }
    
    lazy var descriptionTextCountLabel = UILabel().then {
        $0.text = "0/300"
        $0.setDefaultFont(size: 10, weight: .regular)
        $0.textColor = UIColor(red: 0.7804, green: 0.7804, blue: 0.7804, alpha: 1.0)
    }
    
    // 투표 항목
    private lazy var votingItemLabel = UILabel().then {
        $0.text = "투표 항목을 입력해주세요"
        $0.setDefaultFont(size: 12, weight: .bold)
    }
    
    private lazy var firstVotingItemRoundView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.9098, green: 0.9098, blue: 0.9098, alpha: 1.0).cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    lazy var firstVotingItemTextField = UITextField().then {
        $0.placeholder = "첫번째 투표 항목을 입력해주세요."
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    private lazy var secondVotingItemRoundView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.9647, green: 0.9647, blue: 0.9647, alpha: 1.0)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.9098, green: 0.9098, blue: 0.9098, alpha: 1.0).cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    lazy var secondVotingItemTextField = UITextField().then {
        $0.placeholder = "두번째 투표 항목을 입력해주세요."
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
    }
    
    // 카테고리
    private lazy var categoryLabel = UILabel().then {
        $0.text = "카테고리를 선택해주세요."
        $0.setDefaultFont(size: 12, weight: .bold)
    }
    
    lazy var categoryView = CategoryView()
    
    // 투표 마감일
    private lazy var deadLineTextFieldView = UIView()
    
    lazy var deadLineTextField = UITextField().then {
        $0.tintColor = .clear
        $0.placeholder = "투표 마감일을 설정해주세요"
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
    }
    
    private lazy var calendarIcon = UIImageView().then {
        $0.image = UIImage(named: "ic_calender")
    }
    
    private lazy var blackLine1 = UIView().then {
        $0.backgroundColor = .black
    }
    
    // 베팅 잎
    lazy var bettingTextField = UITextField().then {
        $0.placeholder = "베팅 잎을 입력해주세요."
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.keyboardType = .numberPad

        $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
    }
    
    private lazy var blackLine2 = UIView().then {
        $0.backgroundColor = .black
    }
    
    private lazy var bettingLabel = UILabel().then {
        $0.text = "잎을 베팅할래요."
        $0.setDefaultFont(size: 14, weight: .bold)
    }

    lazy var bettingWarningLabel = UILabel().then {
        $0.text = "OOO님은 지금 🌿100잎을 가지고 있어요"
        $0.setDefaultFont(size: 10, weight: .regular)
        $0.textColor = UIColor(red: 0.7686, green: 0.7608, blue: 0.7608, alpha: 1.0)
    }
    
    // 바텀 화이트 뷰
    lazy var bottomView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // 업로드버튼
    lazy var uploadButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.setImage(UIImage(named: "img_uploadButton"), for: .normal)
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
            bottomView
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
            
            // 카테고리
            categoryLabel,
            categoryView,
            
            // 투표 마감일
            deadLineTextFieldView,
            blackLine1,

            // 베팅 잎
            bettingTextField,
            bettingWarningLabel,
            bettingLabel,
            blackLine2
        ])
        
        titleTextFieldView.addSubview(titleTextField)
        firstVotingItemRoundView.addSubview(firstVotingItemTextField)
        secondVotingItemRoundView.addSubview(secondVotingItemTextField)
        deadLineTextFieldView.addSubview(deadLineTextField)
        deadLineTextFieldView.addSubview(calendarIcon)
        
        bottomView.addSubview(uploadButton)
    }
    
    private func configureConstraints() {
        // 스크롤뷰
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        // 동적 높이를 위한 컨텐트뷰
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        
        // 로고 아이콘
        logoIcon.snp.makeConstraints { make in
            make.width.equalTo(31)
            make.height.equalTo(30)
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView).inset(34)
        }
        
        // 새 투표 생성하기
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoIcon.snp.bottom).offset(32)
            make.leading.equalTo(contentView).inset(28)
        }
        
        // 투표 제목
        titleTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(contentView).inset(25)
            make.height.equalTo(42)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.centerY.equalTo(titleTextFieldView)
            make.leading.trailing.equalTo(titleTextFieldView).inset(16)
        }
        
        titleWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextFieldView.snp.bottom).offset(5)
            make.leading.equalTo(titleTextFieldView).inset(16)
        }
        
        // 상황 설명
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(titleWarningLabel.snp.bottom).offset(9)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(172)
        }
        
        descriptionTextCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(descriptionTextView).inset(15)
            make.bottom.equalTo(descriptionTextView).inset(9)
        }
        
        // 투표 항목
        votingItemLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(titleTextFieldView)
        }
        
        firstVotingItemRoundView.snp.makeConstraints { make in
            make.top.equalTo(votingItemLabel.snp.bottom).offset(7)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(44)
        }
        
        firstVotingItemTextField.snp.makeConstraints { make in
            make.centerY.equalTo(firstVotingItemRoundView)
            make.leading.trailing.equalTo(firstVotingItemRoundView).inset(16)
        }
        
        secondVotingItemRoundView.snp.makeConstraints { make in
            make.top.equalTo(firstVotingItemRoundView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(44)
        }
        
        secondVotingItemTextField.snp.makeConstraints { make in
            make.centerY.equalTo(secondVotingItemRoundView)
            make.edges.equalTo(secondVotingItemRoundView).inset(16)
        }
        
        // 카테고리
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(secondVotingItemRoundView.snp.bottom).offset(15)
            make.leading.equalTo(contentView).inset(35)
        }
        
        categoryView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(7)
            make.leading.equalTo(categoryLabel)
            make.trailing.equalTo(contentView).inset(25)
        }
        
        // 투표 마감일
        deadLineTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(categoryView.snp.bottom).offset(34)
            make.leading.trailing.equalTo(titleTextFieldView)
            make.height.equalTo(30)
        }
        
        deadLineTextField.snp.makeConstraints { make in
            make.centerY.equalTo(deadLineTextFieldView)
            make.leading.equalTo(deadLineTextFieldView).inset(10)
            make.trailing.bottom.equalTo(deadLineTextFieldView)
        }
        
        calendarIcon.snp.makeConstraints { make in
            make.size.equalTo(22)
            make.centerY.equalTo(deadLineTextFieldView)
            make.trailing.equalTo(deadLineTextFieldView).inset(10)
        }
        
        blackLine1.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.top.equalTo(deadLineTextField.snp.bottom).offset(5)
            make.leading.trailing.equalTo(titleTextFieldView)
        }
        
        // 베팅 잎
        bettingTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.top.equalTo(blackLine1.snp.bottom).offset(30)
            make.leading.equalTo(contentView).inset(35)
            make.trailing.equalTo(bettingLabel.snp.leading).offset(-8)
        }
        
        bettingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bettingTextField)
            make.trailing.equalTo(contentView).inset(44)
            make.width.equalTo(98)
        }
        
        blackLine2.snp.makeConstraints { make in
            make.height.equalTo(1.5)
            make.top.equalTo(bettingTextField.snp.bottom).offset(2)
            make.leading.equalTo(titleTextFieldView)
            make.trailing.equalTo(bettingTextField)
        }
        
        bettingWarningLabel.snp.makeConstraints { make in
            make.top.equalTo(blackLine2.snp.bottom)
            make.leading.equalTo(contentView).inset(35)
            make.bottom.equalTo(contentView).offset(-27)
        }
        
        // 바텀 흰색 뷰
        bottomView.snp.makeConstraints { make in
            make.height.equalTo(114)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // 업로드 버튼
        uploadButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomView).inset(37)
            make.trailing.equalTo(bottomView).inset(18)
            make.height.equalTo(50)
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

