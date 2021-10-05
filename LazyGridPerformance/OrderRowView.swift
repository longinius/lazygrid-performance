//
//  OrderRowView.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import SwiftUI

struct OrderRowView: View {
    @State private var toggle: Bool = false

    private var items: [Item] = []
    private var orderableItems: [Item] = []

    init(items: [Item]) {
        self.items = items

        // Create new item for each item to prevent duplicate id
        for item in items {
            orderableItems.append(Item(name: item.name))
        }
    }

    var body: some View {
        Group {
            Text("Name")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

            ForEach(orderableItems, id: \.self) { order in
                OrderItemView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
