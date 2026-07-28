import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @Namespace private var pineMapScope
    @AppStorage("showCompass") private var showCompass: Visibilty: .automatic
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
	@AppStorage("showScale") private var showScale: Visibilty: .automatic
	@AppStorage("showLocation") private var showLocation: Bool = false
	@AppStorage("showZoomButtons") private var showZoomButtons: Bool = false
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
                    .mapControlVisibility(showCompass)
                MapPitchToggle()
                    .mapControlVisibility(showPitchToggle ? .visible: .hidden)
                MapScaleView()
                    .mapControlVisibility(showScale)
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