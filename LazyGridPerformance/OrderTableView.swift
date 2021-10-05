//
//  OrderTableView.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import SwiftUI

struct OrderTableView: View {
    private let items: [Item]

    private var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100), spacing: 0, alignment: .leading),
    ]

    init(items: [Item]) {
        self.items = items

        // Dynamically create columns for items
        let menuColumns = Array(repeating: GridItem(.fixed(100), spacing: 0, alignment: .center), count: items.count)
        columns.append(contentsOf: menuColumns)
    }

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                LazyVGrid(
                    columns: columns,
                    spacing: 0,
                    pinnedViews: [.sectionHeaders]
                ) {
                    Section(header: Text("Section header").padding()) {
                        ForEach(0...20, id: \.self) { index in // Increase number to degrade performance
                            OrderRowView(items: items)
                                .padding(.vertical, 12)
                                .background(index % 2 == 0 ? Color.gray.opacity(0.1) : Color.clear)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
