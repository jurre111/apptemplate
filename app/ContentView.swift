import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @Namespace private var pineMapScope
    @AppStorage("showCompass") private var showCompass: Bool?
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool
	@AppStorage("showScale") private var showScale: Bool?
	@AppStorage("showLocation") private var showLocation: Bool
	@AppStorage("showZoomButtons") private var showZoomButtons: Bool
    @State private var showSheet: Bool = true
    var body: some View {
        Map(scope: pineMapScope)
            .mapScope(pineMapScope)
            .overlay(alignment: .topTrailing) {
                VStack {
                    Button {
                        // action
                    } label: {
                        Image(systemName: "star.fill")
                    }
                }
            }
            .mapControls {
                MapCompass()
                    .mapControlVisibility(showCompass == nil ? .automatic : (showCompass ? .visible : .hidden))
                MapPitchToggle()
                    .mapControlVisibility(showPitchToggle ? .visible: .hidden)
                MapScaleView()
                    .mapControlVisibility(showScale == nil ? .automatic : (showScale ? .visible: .hidden))
                MapUserLocationButton()
                    .mapControlVisibility(showLocation ? .visible: .hidden)
                MapZoomStepper()
                    .mapControlVisibility(showZoomButtons ? .visible: .hidden)
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