//
//  ViewTest.swift
//  IP-iOS
//
//  Created by 이승민 on 6/1/24.
//

import UIKit
import SwiftUI

final class TabBarController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let ifVC = UIHostingController(rootView: IfView())
        let homeVC = UIHostingController(rootView: Home())
        let mypageVC = UIHostingController(rootView: MypageView())
        let signupTest = UIHostingController(rootView: OnboardingView())
        
//        ifVC.title = "이프"
//        homeVC.title = "홈"
//        mypageVC.title = "마이"
        
        setViewControllers([ifVC, homeVC, mypageVC], animated: false)
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(named: "tabbar-leaf-line")?
            .withRenderingMode(.alwaysOriginal)
        items[0].selectedImage = UIImage(named: "tabbar-leaf-fill")?
            .withRenderingMode(.alwaysOriginal)
        items[1].image = UIImage(named: "tabbar-home-line")?
            .withRenderingMode(.alwaysOriginal)
        items[1].selectedImage = UIImage(named: "tabbar-home-fill")?
            .withRenderingMode(.alwaysOriginal)
        items[2].image = UIImage(named: "tabbar-mypage-line")?
            .withRenderingMode(.alwaysOriginal)
        items[2].selectedImage = UIImage(named: "tabbar-mypage-fill")?
            .withRenderingMode(.alwaysOriginal)
        
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .ipBackground
        tabBar.tintColor = .ipLine
        selectedIndex = 1
        
        // 탭바 그림자 설정
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.07
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 7
        
        // 스크롤뷰에서 탭바 라인 제거
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        
        // 이미지 위치 조정
        if let items = tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -6, right: 0)
            }
        }
    }
}

// TODO: 페이지 구현 후 삭제 예정입니다.
class DummyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

