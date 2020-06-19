//
//  UIViewController+.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import UIKit

extension UIViewController: StoryBoardInstantiatable {}

protocol StoryBoardInstantiatable {}
extension StoryBoardInstantiatable where Self: UIViewController {

    static func instantiate() -> Self {
        let bundle = Bundle(for: self.self)
        let name = String(describing: self.self)

        guard let vc = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as? Self else {
            fatalError("UIViewController.instantiate() failed: \(name)")
        }

        return vc
    }
}

extension UIViewController {

    @IBAction func dismiss(_ sender: Any? = nil) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func pop(_ sender: Any? = nil) {
        self.navigationController?.popViewController(animated: true)
    }
}
