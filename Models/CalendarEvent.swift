import SwiftUI

struct CalendarEvent: Identifiable {
    let id = UUID()
    var title: String
    var time: Date
    var duration: TimeInterval
    var color: Color
}
