import SwiftUI
import MapKit

struct ContentView: View {
    let fm = FileManager.default
    @Namespace private var pineMapScope
    @AppStorage("showCompass") private var showCompass: Bool?
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
	@AppStorage("showScale") private var showScale: Bool?
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
                    .mapControlVisibility(getVisibility(showCompass))
                MapPitchToggle()
                    .mapControlVisibility(getVisibility(showPitchToggle))
                MapScaleView()
                    .mapControlVisibility(getVisibility(showScale))
                MapUserLocationButton()
                    .mapControlVisibility(getVisibility(showLocation))
                MapZoomStepper()
                    .mapControlVisibility(getVisibility(showZoomButtons))
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

func getVisibility(value: Bool?) -> Visibility {
    if let bool = value {
        return bool ? .visible : .hidden
    } else {
        return .automatic
    }
}

#Preview {
    ContentView()
}