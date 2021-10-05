//
//  OrderViewModel.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import Foundation

extension OrderView {
    class ViewModel: ObservableObject {

        @Published var items: [Item] = []

        init() {
            generateItems()
        }

        /// Generate placeholder items
        func generateItems() {
            self.items.removeAll()
            for i in 0...8 {
                items.append(Item(name: "Item \(i)"))
            }
        }
    }
}

struct Item: Identifiable, Hashable {
    let id: UUID
    let name: String

    init(name: String) {
        self.id = UUID()
        self.name = name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
