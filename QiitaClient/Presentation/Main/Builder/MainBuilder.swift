//
//  MainBuilder.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

struct MainBuilder {

    func build() -> UIViewController {
        let viewController = MainViewController.instantiate()
        let presenter = MainPresenterImpl()
        let wireframe = MainWireframeImpl()
        let articleUseCase = ArticleUseCaseProvider.provide()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.wireframe = wireframe
        presenter.viewController = viewController
        presenter.loadingViewManager = LoadingViewManager()
        presenter.articleUseCase = articleUseCase

        wireframe.viewController = viewController

        return viewController
    }
}
