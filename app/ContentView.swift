import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @State private var showSheet = true
    var body: some View {
        Map()
            .sheet(isPresented: $showSheet) {
                List {
                    Section("Test") {
                        Text("Test")
                        Text("Testing")
                    }
                }
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.height(75), .medium, .large])
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .interactiveDismissDisabled()
            }
    }
}

#Preview {
    ContentView()
}