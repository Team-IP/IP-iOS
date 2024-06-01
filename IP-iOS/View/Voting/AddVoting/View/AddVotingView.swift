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
    private lazy var scrollView = UIScrollView().then {
        $0.keyboardDismissMode = .onDrag // 스크롤 시 키보드 숨김
    }
    
    private lazy var contentView = UIView()
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "새 투표 생성하기"
        $0.font = .boldSystemFont(ofSize: 25)
    }
    
    // 투표 제목
    private lazy var titleTextFieldView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.green.cgColor
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
    
    // 업로드버튼
    lazy var uploadButton = UIButton().then {
        $0.layer.cornerRadius = 8
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
            titleLabel,
            scrollView
        ])
        
        scrollView.addSubview(contentView)
        
        
        contentView.addSubviews([
            titleTextFieldView,
            titleWarningLabel,
            votingItemLabel,
            firstVotingItemRoundView,
            secondVotingItemRoundView,
            deadLineTextFieldView
        ])
        
        titleTextFieldView.addSubview(titleTextField)
        firstVotingItemRoundView.addSubview(firstVotingItemTextField)
        secondVotingItemRoundView.addSubview(secondVotingItemTextField)
        deadLineTextFieldView.addSubview(deadLineTextField)
    }
    
    private func configureConstraints() {
        // 새 투표 생성하기
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).offset(8)
        }
        
        // 스크롤뷰
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.bottom.equalTo(uploadButton.snp.top).offset(-20)
        }
        
        // 동적 높이를 위한 컨텐트뷰
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        
        // 투표 제목
        titleTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
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
        
        // 투표 항목
        votingItemLabel.snp.makeConstraints { make in
            make.top.equalTo(titleWarningLabel.snp.bottom).offset(30)
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
            make.bottom.equalTo(contentView)
        }
        
        deadLineTextField.snp.makeConstraints { make in
            make.edges.equalTo(deadLineTextFieldView).inset(5)
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
