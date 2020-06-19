//
//  TransitToMainWireframe.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol TransitToMainWireframe: class {
    var viewController: UIViewController? { get set }
    func replaceToMain()
}

extension TransitToMainWireframe {

    func replaceToMain() {
        let vc = MainBuilder().build()
        (self.viewController?.view.window?.windowScene?.delegate as? SceneDelegate)?.window?.rootViewController = vc
    }
}
