//
//  CustomTabBarController.swift
//  HelloDuna
//
//  Created by yeongwoocho on 2022/07/12.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    enum TabBarPage: CaseIterable {
        case friend
        case chat
        case view
        case shop
        case more

        init?(index: Int) {
            switch index {
            case 0:
                self = .friend
            case 1:
                self = .chat
            case 2:
                self = .view
            case 3:
                self = .shop
            case 4:
                self = .more
            default:
                return nil
            }
        }
        
        func pageTitleValue() -> String {
            switch self {
            case .friend:
                return "친구"
            case .chat:
                return "채팅"
            case .view:
                return "뷰"
            case .shop:
                return "쇼핑"
            case .more:
                return "더보기"
            }
        }

        func pageUnselectedImage() -> UIImage? {
            switch self {
            case .friend:
                return UIImage(named: "ic_unselected_person")
            case .chat:
                return UIImage(named: "ic_unselected_chat")
            case .view:
                return UIImage(named: "ic_unselected_hash")
            case .shop:
                return UIImage(named: "ic_unselected_shop")
            case .more:
                return UIImage(named: "ic_unselected_more")
            }
        }
        
        func pageSelectedImage() -> UIImage? {
            switch self {
            case .friend:
                return UIImage(named: "ic_selected_person")
            case .chat:
                return UIImage(named: "ic_selected_chat")
            case .view:
                return UIImage(named: "ic_selected_hash")
            case .shop:
                return UIImage(named: "ic_selected_shop")
            case .more:
                return UIImage(named: "ic_selected_more")
            }
        }
        
        func pageOrderNumber() -> Int {
            switch self {
            case .friend:
                return 0
            case .chat:
                return 1
            case .view:
                return 2
            case .shop:
                return 3
            case .more:
                return 4
            }
        }
        
        func pageViewController() -> UIViewController {
            switch self {
            case .friend:
                return ListViewController()
            case .chat:
                return UIViewController()
            case .view:
                return UIViewController()
            case .shop:
                return UIViewController()
            case .more:
                return UIViewController()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
        configureViewControllers()
    }
    
}

extension CustomTabBarController {
    
    private func configureTabBar() {
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    private func getNavigationController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: page.pageViewController())
        navController.tabBarItem = UITabBarItem(
            title: nil,
            image: page.pageUnselectedImage(),
            selectedImage: page.pageSelectedImage())
        return navController
    }
    
    private func configureViewControllers() {
        let controllers = TabBarPage.allCases.map {
            return getNavigationController($0)
        }
        self.viewControllers = controllers
    }
    
}
