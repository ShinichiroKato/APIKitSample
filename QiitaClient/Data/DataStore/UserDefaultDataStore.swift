//
//  UserDefaultDataStore.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

import Foundation

final class UserDefaultsDataStoreProvider {
    static private var shared = UserDefaultsDataStoreImpl()

    static func provide() -> UserDefaultsDataStore {
        return UserDefaultsDataStoreProvider.shared
    }
}

protocol UserDefaultsDataStore {

    func get<T>(for key: UserDefaultsKey) -> T?
    func get<T>(for key: UserDefaultsKey, optionKey: String) -> T?
    func set<T>(value: T?, for key: UserDefaultsKey)
    func set<T>(value: T?, for key: UserDefaultsKey, optionKey: String)
    func registerDefault<T>(value: T, for key: UserDefaultsKey)
    func registerDefault<T>(value: T, for key: UserDefaultsKey, optionKey: String)
}

struct UserDefaultsKey {

    var rawValue: String

    static let alreadyLaunched = UserDefaultsKey(rawValue: UserDefaultsKeyString.alreadyLaunched.rawValue)
}

enum UserDefaultsKeyString: String {
    case alreadyLaunched = "UserDefaultsKeyString.alreadyLaunched"
}

final class UserDefaultsDataStoreImpl: UserDefaultsDataStore {

    func get<T>(for key: UserDefaultsKey) -> T? {
        return self.get(for: key, optionKey: "")
    }

    func get<T>(for key: UserDefaultsKey, optionKey: String) -> T? {
        return UserDefaults.standard.object(forKey: "\(key.rawValue)\(optionKey)") as? T
    }

    func set<T>(value: T?, for key: UserDefaultsKey) {
        self.set(value: value, for: key, optionKey: "")
    }

    func set<T>(value: T?, for key: UserDefaultsKey, optionKey: String) {
        UserDefaults.standard.set(value, forKey: "\(key.rawValue)\(optionKey)")
    }

    func registerDefault<T>(value: T, for key: UserDefaultsKey) {
        self.registerDefault(value: value, for: key, optionKey: "")
    }

    func registerDefault<T>(value: T, for key: UserDefaultsKey, optionKey: String) {
        UserDefaults.standard.register(defaults: ["\(key.rawValue)\(optionKey)": value])
    }
}
