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
        
        // (1) VC 생성
        let ifVC = UIHostingController(rootView: IfView())
        
        let homeVC = UIHostingController(rootView: Home())
        
        let mypageVC = UIHostingController(rootView: MypageView())
        
        // (2) Tab Bar 이름 설정
        ifVC.title = "이프"
        homeVC.title = "홈"
        mypageVC.title = "마이"
        
        // (3) Tab Bar로 사용하기 위한 뷰 컨트롤러들 설정
        setViewControllers([ifVC, homeVC, mypageVC], animated: false)
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        
        // (4) Tab Bar 이미지 설정
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "leaf")
        items[1].image = UIImage(systemName: "house")
        items[2].image = UIImage(systemName: "gear")
    }
}

// TODO: 페이지 구현 후 삭제 예정입니다.
class DummyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

