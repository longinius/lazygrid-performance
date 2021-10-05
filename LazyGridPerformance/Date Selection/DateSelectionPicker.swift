//
//  DateSelectionPicker.swift
//  LazyGridPerformance
//
//  Created by Lars on 05.10.21.
//

import SwiftUI
import SwifterSwift

/// Date selection view with forward and backward buttons
struct DateSelectionPicker: View {
    /// Selected date
    @Binding var selection: Date

    var body: some View {
        HStack(spacing: 16) {
            backward

            DatePicker("Select day of ordering", selection: $selection, in: Date()..., displayedComponents: [.date])
                .labelsHidden()

            forward
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.accentColor)
    }

    private var forward: some View {
        Button(action: selectNextDay) {
            Image(systemName: "chevron.forward")
        }
    }

    private var backward: some View {
        Button(action: selectPreviousDay) {
            Image(systemName: "chevron.backward")
        }
    }

    /// Selects the next day
    private func selectNextDay() {
        if let nextDay = Calendar.current.date(byAdding: DateComponents(day: 1), to: selection) {
            selection = nextDay
        }
    }

    /// Selects the previous day, if day is not in the past
    private func selectPreviousDay() {
        if let previousDay = Calendar.current.date(byAdding: DateComponents(day: -1), to: selection) {
            if previousDay.isInPast && !previousDay.isInToday {
                return
            }

            selection = previousDay
        }
    }
}


// MARK: - Previews

struct DateSelectionPicker_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectionPicker(selection: .constant(Date()))
    }
}
