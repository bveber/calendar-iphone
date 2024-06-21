import SwiftUI

struct EventView: View {
    @State var event: CalendarEvent
    @State private var offset: CGSize = .zero
    @State private var height: CGFloat = 60

    var body: some View {
        VStack {
            Text(event.title)
                .padding(5)
                .background(event.color)
                .cornerRadius(5)
                .offset(offset)
                .frame(height: height)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.offset = gesture.translation
                        }
                        .onEnded { _ in
                            self.offset = .zero
                        }
                )
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.height = 60 * value
                        }
                        .onEnded { _ in
                            self.height = max(60, self.height)
                        }
                )
        }
    }
}
