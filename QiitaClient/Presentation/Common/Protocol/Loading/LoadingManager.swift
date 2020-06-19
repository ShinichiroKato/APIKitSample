//
//  LoadingManager.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

final class LoadingViewManager {

    private var showCount: UInt = 0
    private weak var loadingView: LoadingView?

    func show(on view: UIView) {
        if self.showCount == 0 {
            self.loadingView = LoadingView.show(on: view)
        }
        self.showCount += 1
    }

    func hide() {
        if self.showCount > 0 {
            self.showCount -= 1
            if self.showCount == 0 {
                self.loadingView?.removeFromSuperview()
                self.loadingView = nil
            }
        }
    }
}
