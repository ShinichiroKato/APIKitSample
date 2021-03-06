//
//  TransitToSplashWireframe.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol TransitToSplashWireframe: class {
    var viewController: UIViewController? { get set }
    func replaceToSplash()
}

extension TransitToSplashWireframe {

    func replaceToSplash() {
        let vc = SplashBuilder().build()
        (self.viewController?.view.window?.windowScene?.delegate as? SceneDelegate)?.window?.rootViewController = vc
    }
}
