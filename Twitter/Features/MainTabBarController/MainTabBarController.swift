//
//  MainTabBarController.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - Properties
    
    
    // MARK: - Components
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(handleActionButton(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureControllers()
        self.showNagigationBar()
        self.showTabBar()
        self.configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleActionButton(_ sender: UIButton) {
        print("button tapped")
    }
    
    
    // MARK: - Methods
    private func configureUI() {
        self.view.addSubview(actionButton)
        self.actionButton.activeAnchorBasedOn(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        self.actionButton.layer.cornerRadius = 56 / 2
    }
    
    private func configureControllers() {
        let feed = FeedViewController()
        let navOne = templateNavigationController(UIImage(named: "home_unselected"), feed)
        
        let explore = ExploreViewController()
        let navTwo = templateNavigationController(UIImage(named: "search_unselected"), explore)
        
        let notifications = NotificationsViewController()
        let navThree = templateNavigationController(UIImage(named: "like_unselected"), notifications)
        
        let conversations = ConversationsViewController()
        let navFour = templateNavigationController(UIImage(named: "ic_mail_outline_white_2x-1"), conversations)
        
        self.viewControllers = [navOne, navTwo, navThree, navFour]
    }
    
    private func templateNavigationController(_ image: UIImage?, _ root: UIViewController) -> UINavigationController {
        let navgation = UINavigationController(rootViewController: root)
        navgation.tabBarItem.image = image
        navgation.navigationBar.barTintColor = .white
        return navgation
    }
    
    private func showNagigationBar() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    func showTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
