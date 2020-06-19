//
//  CanShowLoading.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol CanShowLoading: class {
    var loadingViewManager: LoadingViewManager! { get set }
    var viewController: UIViewController! { get }

    func showLoadingView()
    func hideLoadingView()
}

extension CanShowLoading {

    func showLoadingView() {
        self.loadingViewManager.show(on: self.viewController.view)
    }

    func hideLoadingView() {
        self.loadingViewManager.hide()
    }
}
