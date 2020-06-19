//
//  SplashBuilder.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

struct SplashBuilder {

    func build() -> SplashViewController {
        let viewController = SplashViewController.instantiate()
        let presenter = SplashPresenterImpl()
        let wireframe = SplashWireframeImpl()
        let firstLaunchUseCase = FirstLaunchUseCaseProvider.provide()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.wireframe = wireframe
        presenter.firstLaunchUseCase = firstLaunchUseCase

        wireframe.viewController = viewController

        return viewController
    }
}
