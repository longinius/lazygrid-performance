//
//  OrderItemView.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import SwiftUI

struct OrderItemView: View {
    @State private var isOrdered: Bool = Bool.random()
    @State private var isSheetIsShowing: Bool = false

    var body: some View {
        ZStack {
            Toggle("Order menu", isOn: $isOrdered)
                .toggleStyle(CheckButtonToggleStyle())

            if isOrdered {
                Button {
                    isSheetIsShowing.toggle()
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundColor(.accentColor)
                }
                .offset(x: 36)
            }
        }
        // Critical part, if removed the performance is much better
        .sheet(isPresented: $isSheetIsShowing) {
            EmptyView()
        }
    }
}
