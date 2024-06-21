import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var events: [CalendarEvent] = []
}

struct WeeklyView: View {
    @StateObject private var viewModel = CalendarViewModel()

    let hours = Array(6...23) // Display hours from 6 AM to 11 PM
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        VStack {
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 1) {
                    ForEach(hours, id: \.self) { hour in
                        ForEach(days, id: \.self) { day in
                            Rectangle()
                                .frame(height: 60)
                                .overlay(
                                    VStack {
                                        Text("\(hour):00")
                                            .font(.footnote)
                                            .padding(2)
                                        Spacer()
                                    }
                                )
                                .background(Color.gray.opacity(0.1))
                        }
                    }
                }
            }
            .overlay(
                ForEach(viewModel.events) { event in
                    EventView(event: event)
                }
            )
        }
        .onAppear {
            // Sample events for demonstration
            viewModel.events = [
                CalendarEvent(title: "Walk", time: Date(), duration: 3600, color: .blue),
                CalendarEvent(title: "Conditioning", time: Date(), duration: 7200, color: .purple)
            ]
        }
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}
