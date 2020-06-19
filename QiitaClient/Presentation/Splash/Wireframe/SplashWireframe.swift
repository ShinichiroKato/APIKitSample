//
//  SplashWireframe.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol SplashWireframe: TransitToWelcomeWireframe, TransitToMainWireframe {
    var viewController: UIViewController? { get set }
}

final class SplashWireframeImpl: SplashWireframe {

    weak var viewController: UIViewController?
}
