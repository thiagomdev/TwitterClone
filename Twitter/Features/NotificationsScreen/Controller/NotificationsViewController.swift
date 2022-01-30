//
//  NotificationsViewController.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class NotificationsViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Components
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - Methods
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Notifications"
    }
}
