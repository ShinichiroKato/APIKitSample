//
//  Array+Identifiable.swift
//  QiitaClient
//  
//  Created by Shinichiro Kato on 2020/06/19.
//  Copyright © 2020 Shinichiro Kato. All rights reserved.
//

protocol Id: Hashable {
    var rawValue: String { get }
}

extension Id {
    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}

protocol Identifiable: Hashable {
    associatedtype Identifier: Id

    var id: Identifier { get }
}

extension Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Array where Element: Identifiable {

    var ids: [Element.Identifier] { self.map { $0.id } }

    func find(by id: Element.Identifier) -> Element? {
        self.first(where: { $0.id == id })
    }

    func filter(by ids: [Element.Identifier]) -> Self {
        self.filter({ ids.contains($0.id) })
    }

    func filterNot(by ids: [Element.Identifier]) -> Self {
        self.filter({ !ids.contains($0.id) })
    }

    func update(_ element: Element) -> Self {
        self.map { ($0.id == element.id) ? element : $0 }
    }

    func concat(_ element: Element) -> Self {
        self + [element]
    }

    func concat(_ collection: Self) -> Self {
        self + collection
    }

    func unique(last: Bool = false) -> Self {
        var dict = [Element: Bool]()
        return self.reduce([], { (tmp, element) in
            if dict[element] != nil { return tmp }
            dict[element] = true
            return tmp + [element]
        })
    }

    func merge(_ collection: Self) -> Self {
        self.concat(collection).unique(last: true)
    }

    func merge(_ element: Element) -> Self {
        self.concat(element).unique(last: true)
    }

    func delete(by id: Element.Identifier) -> Self {
        self.filter({ $0.id != id })
    }
}
