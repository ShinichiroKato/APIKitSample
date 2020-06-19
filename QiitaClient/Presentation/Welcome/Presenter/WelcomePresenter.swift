//
//  WelcomePresenter.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

protocol WelcomePresenter: class {
    var view: WelcomeView? { get set }
    var wireframe: WelcomeWireframe! { get set }
}

class WelcomePresenterImpl: WelcomePresenter {

    weak var view: WelcomeView?
    var wireframe: WelcomeWireframe!
}
