//
//  FeedViewController.swift
//  Twitter
//
//  Created by Thiago Monteiro on 29/01/22.
//

import UIKit

class FeedViewController: UIViewController {

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
        let image = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        image.contentMode = .scaleAspectFit
        navigationItem.titleView = image
    }
}
