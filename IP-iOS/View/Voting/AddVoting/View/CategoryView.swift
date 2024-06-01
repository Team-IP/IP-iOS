//
//  CategoryView.swift
//  IP-iOS
//
//  Created by 이승민 on 6/2/24.
//

import UIKit

final class CategoryView: UIView {
    // MARK: - View
    lazy var allButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_all_clear"), for: .normal)
        $0.tag = 0
    }
    
    lazy var loveButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_love_clear"), for: .normal)
        $0.tag = 1
    }
    
    lazy var economyButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_economy_clear"), for: .normal)
        $0.tag = 2
    }
    
    lazy var sportsButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_sports_clear"), for: .normal)
        $0.tag = 3
    }
    
    lazy var dailyButton = UIButton().then {
        $0.setImage(UIImage(named: "ic_daily_clear"), for: .normal)
        $0.tag = 4
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
            allButton,
            loveButton,
            economyButton,
            sportsButton,
            dailyButton
        ])
        
    }
    
    private func configureConstraints() {
        [allButton, loveButton, economyButton, sportsButton, dailyButton].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
        }
        
        allButton.snp.makeConstraints { make in
            make.width.equalTo(89)
            make.top.leading.equalToSuperview()
        }
        
        loveButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.top.equalTo(allButton)
            make.leading.equalTo(allButton.snp.trailing).offset(6)
        }
        
        economyButton.snp.makeConstraints { make in
            make.width.equalTo(101)
            make.top.equalTo(allButton)
            make.leading.equalTo(loveButton.snp.trailing).offset(6)
        }
        
        sportsButton.snp.makeConstraints { make in
            make.width.equalTo(83)
            make.leading.equalToSuperview()
            make.top.equalTo(allButton.snp.bottom).offset(6)
            make.bottom.equalToSuperview()
        }
        
        dailyButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.top.equalTo(sportsButton)
            make.leading.equalTo(sportsButton.snp.trailing).offset(6)
            make.bottom.equalTo(sportsButton)
        }
    }
}
