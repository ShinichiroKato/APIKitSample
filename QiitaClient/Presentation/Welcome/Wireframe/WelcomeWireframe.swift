//
//  WelcomeWireframe.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol WelcomeWireframe: class {
    var viewController: UIViewController? { get set }
}

class WelcomeWireframeImpl: WelcomeWireframe {

    weak var viewController: UIViewController?
}
