//
//  MainTabBarController.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureControllers()
    }
    
    private func configureControllers() {
        let feed = FeedViewController()
        let explore = ExploreViewController()
        let notifications = NotificationsViewController()
        let conversations = ConversationsViewController()
        
        self.viewControllers = [feed, explore, notifications, conversations]
    }
}
