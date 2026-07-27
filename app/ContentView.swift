import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @State private var showsheet = true
    var body: some View {
        Map()
            .sheet(isPresented: $showSheet) {
                List {
                    Section("Test") {
                        Text("Test")
                    }
                }
                .presentationDetents([.height(80), .medium, .large])
                .presentationBackgroundInteraction(.enabled(upTrough: .medium))
                .interactiveDismissDisabled()
            }
    }
}

#Preview {
    ContentView()
}