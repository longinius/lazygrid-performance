//
//  CheckButtonToggleStyle.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import SwiftUI

struct CheckButtonToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(configuration.isOn ? Color.clear : Color.gray, lineWidth: 1)
                    .background(backgroundColor(isOn: configuration.isOn))
                    .clipShape(Circle())

                // Checkmark overlay
                if configuration.isOn {
                    Image("checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .offset(x: 4, y: -2)
                }
            }
        }
        .accessibility(label: Text(configuration.isOn ? "Ordered" : "Not ordered"))
        .frame(width: 30, height: 30)
        .shadow(color: Color.black.opacity(0.1), radius: 4)
    }

    private func backgroundColor(isOn: Bool) -> Color {
        if isOn {
            return Color.blue
        } else {
            return Color.white
        }
    }

}
