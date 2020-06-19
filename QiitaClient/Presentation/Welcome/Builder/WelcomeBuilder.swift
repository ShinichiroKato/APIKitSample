//
//  WelcomeBuilder.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

struct WelcomeBuilder {

    func build() -> UIViewController {
        let viewController = WelcomeViewController.instantiate()
        let presenter = WelcomePresenterImpl()
        let wireframe = WelcomeWireframeImpl()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.wireframe = wireframe

        wireframe.viewController = viewController

        return viewController
    }
}
