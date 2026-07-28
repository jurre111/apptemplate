import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @Namespace private var pineMapScope
    @AppStorage("alwaysShowCompass") private var alwaysShowCompass: Bool = false
    @AppStorage("alwaysShowPitchToggle") private var alwaysShowPitchToggle: Bool = false
    @State private var showSheet: Bool = true
    var body: some View {
        Map(scope: pineMapScope)
            .mapScope(pineMapScope)
            .overlay(alignment: .topTrailing) {
                VStack {
                    if alwaysShowCompass {
                        MapCompass()
                            .mapControlVisibility(.visible)
                    }
                    if alwaysShowPitchToggle {
                        MapPitchToggle()
                            .mapControlVisibility(.visible)
                    }
                    Button {
                        // action
                    } label: {
                        Image(systemName: "star.fill")
                    }
                }
            }
            .mapControls {
                
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