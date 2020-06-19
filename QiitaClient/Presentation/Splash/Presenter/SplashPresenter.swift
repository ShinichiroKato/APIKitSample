//
//  SplashPresenter.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

protocol SplashPresenter: class {
    var view: SplashView? { get set }
    var wireframe: SplashWireframe! { get set }
    var firstLaunchUseCase: FirstLaunchUseCase! { get set }

    func executeLaunchOperation()
}

final class SplashPresenterImpl: SplashPresenter {

    weak var view: SplashView?
    var wireframe: SplashWireframe!
    var firstLaunchUseCase: FirstLaunchUseCase!

    func executeLaunchOperation() {
//        if self.firstLaunchUseCase.isFirstLaunch {
//            self.wireframe.replaceToWelcome()
//        } else {
            self.wireframe.replaceToMain()
//        }
    }
}
