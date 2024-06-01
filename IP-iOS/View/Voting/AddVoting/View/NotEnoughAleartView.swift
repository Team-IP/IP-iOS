//
//  NotEnoughAleartView.swift
//  IP-iOS
//
//  Created by 이승민 on 6/2/24.
//

import UIKit

final class NotEnoughAleartView: UIView {
    // MARK: - View
    private lazy var topLabel = UILabel().then {
        $0.text = "잎이 부족해요!"
        $0.setDefaultFont(size: 22, weight: .bold)
    }
    
    private lazy var bottomLabel = UILabel().then {
        $0.text = "잎을 더 구매하러 가시겠어요?"
        $0.setDefaultFont(size: 16, weight: .regular)
    }
    
    lazy var goBuyButton = UIButton().then {
        $0.setImage(UIImage(named: "img_goBuyButton"), for: .normal)
    }
    
    lazy var retryButton = UIButton().then {
        $0.setImage(UIImage(named: "img_retryButton"), for: .normal)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        
        addViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func addViews() {
        self.addSubviews([
            topLabel,
            bottomLabel,
            goBuyButton,
            retryButton
        ])
    }
    
    private func configureConstraints() {
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.centerX.equalToSuperview()
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(19)
            make.centerX.equalToSuperview()
        }
        
        goBuyButton.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomLabel.snp.bottom).offset(39)
        }
        
        retryButton.snp.makeConstraints { make in
            make.top.equalTo(goBuyButton.snp.bottom).offset(11)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(22)
        }
    }
}
