//
//  MainPresenter.swift
//  QiitaClient
//
//  Created by kato on 19/06/2020.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation
import APIKit

protocol MainPresenter: class {
    var view: MainView? { get set }
    var wireframe: MainWireframe! { get set }
    var viewController: UIViewController! { get set }
    var loadingViewManager: LoadingViewManager! { get set}
    var articleUseCase: ArticleUseCase! { get set }

    func viewDidLoad()
}

final class MainPresenterImpl: MainPresenter, CanShowError, CanShowLoading {

    weak var view: MainView?
    var wireframe: MainWireframe!
    var viewController: UIViewController!
    var loadingViewManager: LoadingViewManager!
    var articleUseCase: ArticleUseCase!

    func viewDidLoad() {
        self.getArticles()
    }
}

extension MainPresenterImpl {

    private func getArticles() {
        self.showLoadingView()
        self.articleUseCase.get { [weak self] result in
            self?.hideLoadingView()
            switch result {
            case .success(let articles):
                self?.view?.reloadData(articles)
            case .failure(let error):
                self?.showError(error) { [weak self] in
                    self?.getArticles()
                }
            }
        }
    }
}
