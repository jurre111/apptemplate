import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @AppStorage("alwaysShowCompass") private var alwaysShowCompass: Bool = false
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
    @State private var showSheet: Bool = true
    var body: some View {
        Map()
            .mapControls {
                if alwaysShowCompass {
                    MapCompass()
                        .mapControlVisibility(.visible)
                }
                if showPitchToggle {
                    MapPitchToggle()
                }
            }
            .sheet(isPresented: $showSheet) {
                SettingsView()
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.height(70), .medium, .large])
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .interactiveDismissDisabled()
            }
    }
}

#Preview {
    ContentView()
}