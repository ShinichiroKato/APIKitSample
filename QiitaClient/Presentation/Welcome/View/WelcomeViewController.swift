//
//  WelcomeViewController.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol WelcomeView: class {
    var presenter: WelcomePresenter! { get set }
    
}

// MARK: - vars and life cycle
class WelcomeViewController: UIViewController {

    var presenter: WelcomePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - WelcomeView
extension WelcomeViewController: WelcomeView {
}
