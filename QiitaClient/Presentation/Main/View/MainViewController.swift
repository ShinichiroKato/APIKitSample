//
//  MainViewController.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol MainView: class {
    var presenter: MainPresenter! { get set }

    func reloadData(_ articles: [Article])
}

// MARK: - vars and life cycle
class MainViewController: UIViewController {

    var presenter: MainPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

// MARK: - MainView
extension MainViewController: MainView {

    func reloadData(_ articles: [Article]) {
        print(articles)
    }
}
