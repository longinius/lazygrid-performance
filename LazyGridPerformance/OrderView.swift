//
//  OrderView.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import SwiftUI

struct OrderView: View {
    @State private var date: Date = Date()

    @StateObject private var viewModel: ViewModel

    init() {
        let viewModel = ViewModel()
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack {
                DateSelectionPicker(selection: $date)
                    .onChange(of: date) { _ in
                        // Generate new set of items if date is changed
                        viewModel.generateItems()
                    }

                // Order table
                OrderTableView(items: viewModel.items)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}
