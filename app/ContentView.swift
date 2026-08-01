import SwiftUI
import MapKit



@Observable
class LocManager: NSObject {
    private let manager = CLLocationManager()
    
    func askPermission() {
        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
    }
}

struct ContentView: View {
    let fm = FileManager.default
    @Namespace private var pineMapScope
    @AppStorage("showCompass") private var showCompass: Bool = true
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
	@AppStorage("showScale") private var showScale: Bool?
	@AppStorage("showLocation") private var showLocation: Bool = true
    @State private var locManager = LocManager()
    @State private var showSheet: Bool = true
    var body: some View {
        Map(scope: pineMapScope)
            .mapScope(pineMapScope)
            .overlay(alignment: .topTrailing) {
                VStack(spacing: 10) {
                    ControlGroup {
                        if showLocation {
                            MapUserLocationButton(scope: pineMapScope)
                                .simultaneousGesture(
                                    TapGesture().onEnded {
                                        locManager.askPermission()
                                    }
                                )
                        }
                    }
                    .controlGroupStyle(.compactMenu)
                    if showPitchToggle {
                        MapPitchToggle(scope: pineMapScope)
                    }
                    if showCompass {
                        MapCompass(scope: pineMapScope)
                    }
                }
                .padding()
            }
            .mapControls {
                MapScaleView(scope: pineMapScope)
                    .mapControlVisibility({if let value = showScale { value ? .visible : .hidden}  else { .automatic }}())
            }
            .sheet(isPresented: $showSheet) {
                SettingsView()
                .presentationBackground(.thickMaterial)
                // .presentationBackground {
                //     ZStack {
                //         Rectangle().fill(.regularMaterial)
                //         Color(.systemBackground).opacity(0.4)
                //     }
                // }
                .presentationDetents([.height(70), PresentationDetent.fraction(0.4), .large])
                .presentationBackgroundInteraction(.enabled(upThrough: PresentationDetent.fraction(0.4)))
                .interactiveDismissDisabled()
            }
    }
}

func getVisibility(_ value: Bool?) -> Visibility {
    if let bool = value {
        return bool ? .visible : .hidden
    } else {
        return .automatic
    }
}

#Preview {
    ContentView()
}