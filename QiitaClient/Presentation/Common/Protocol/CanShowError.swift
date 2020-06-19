//
//  CanShowError.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

protocol CanShowError {
    var viewController: UIViewController! { get }

    func showError(_ error: ErrorMessage, retryCompletion:  @escaping () -> Void)
}

extension CanShowError {

    func showError(_ error: ErrorMessage, retryCompletion:  @escaping () -> Void) {
        let vc = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        let retry = UIAlertAction(title: "Retry", style: .default) { _ in
            retryCompletion()
        }
        vc.addAction(ok)
        vc.addAction(retry)
        self.viewController.present(vc, animated: true)
    }
}
