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
        ZStack(alignment: .topTrailing) {
            Map(scope: pineMapScope)
                .mapControls {
                    MapScaleView(scope: pineMapScope)
                        .mapControlVisibility({if let value = showScale { value ? .visible : .hidden}  else { .automatic }}())
                }
            VStack(spacing: 10) {
                VStack(spacing: 0) {
                    Button {
                        // ?
                    } label: {
                        Image(systemName: "map")
                            .foregroundColor(.secondary)
                            .frame(width: 44, height: 44, alignment: .center)
                    }
                    if showLocation {
                        Divider()
                            .frame(width: 44)
                        Button {
                            locManager.askPermission()
                        } label: {
                            Image(systemName: "location"), alignment: .center)
                                .foregroundColor(.secondary)
                                .frame(width: 44, height: 44, alignment: .center)
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.thickMaterial)
                )
                
                if showPitchToggle {
                    Button {
                        // pitch
                    } label: {
                        Image(systemName: "view.2d")
                            .foregroundColor(.secondary)
                            .frame(width: 44, height: 44, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.thickMaterial)
                            )
                    }
                }
                if showCompass {
                    MapCompass(scope: pineMapScope)
                }
            }
        }
        .mapScope(pineMapScope)
        .sheet(isPresented: $showSheet) {
            Button("Location") {
                locManager.askPermission()
            } // SettingsView()
            .presentationBackground(.thickMaterial)
            .presentationDetents([.height(70), .medium, .large])
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
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