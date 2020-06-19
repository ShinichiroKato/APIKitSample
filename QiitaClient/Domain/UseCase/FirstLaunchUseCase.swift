//
//  FirstLaunchUseCase.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

final class FirstLaunchUseCaseProvider {
    static func provide() -> FirstLaunchUseCase {
        return FirstLaunchUseCaseImpl(
            userDefaultsDataStore: UserDefaultsDataStoreProvider.provide()
        )
    }
}

protocol FirstLaunchUseCase {
    var isFirstLaunch: Bool { get }
    func markFirstLaunch()
}

final class FirstLaunchUseCaseImpl: FirstLaunchUseCase {

    private var userDefaultsDataStore: UserDefaultsDataStore

    init(userDefaultsDataStore: UserDefaultsDataStore) {
        self.userDefaultsDataStore = userDefaultsDataStore
    }

    var isFirstLaunch: Bool {
        return !(self.userDefaultsDataStore.get(for: .alreadyLaunched) ?? false)
    }

    func markFirstLaunch() {
        self.userDefaultsDataStore.set(value: true, for: .alreadyLaunched)
    }
}
