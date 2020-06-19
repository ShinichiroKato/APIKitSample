//
//  SplashViewController.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol SplashView: class {
    var presenter: SplashPresenter! { get set }

}

// MARK: - vars and life cycle
final class SplashViewController: UIViewController {

    var presenter: SplashPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.executeLaunchOperation()
    }
}

// MARK: - SplashView
extension SplashViewController: SplashView {
}
