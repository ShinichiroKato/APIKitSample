//
//  TransitToWelcomeWireframe.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol TransitToWelcomeWireframe: class {
    var viewController: UIViewController? { get set }
    func replaceToWelcome()
}

extension TransitToWelcomeWireframe {

    func replaceToWelcome() {
        let vc = WelcomeBuilder().build()
        (self.viewController?.view.window?.windowScene?.delegate as? SceneDelegate)?.window?.rootViewController = vc
    }
}
