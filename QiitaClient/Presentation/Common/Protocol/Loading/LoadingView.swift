//
//  LoadingManager.swift
//  QiitaClient
//
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

final class LoadingView: NibView {

    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
}

extension LoadingView {

    static func show(on view: UIView) -> LoadingView {
        let loadingView = LoadingView()
        view.addSubview(loadingView)
        view.bringSubviewToFront(loadingView)
        loadingView.indicatorView.startAnimating()
        loadingView.frame = view.bounds
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return loadingView
    }
}
