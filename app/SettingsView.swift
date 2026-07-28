import SwiftUI

struct SettingsView: View {
	@AppStorage("showCompass") private var showCompass: Bool?
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
	@AppStorage("showScale") private var showScale: Bool?
	@AppStorage("showLocation") private var showLocation: Bool = false
	@AppStorage("showZoomButtons") private var showZoomButtons: Bool = false
	var body: some View {
		NavigationStack {
			List {
				NavigationLink("User Interface") {
					List {
						Section("Map UI") {
							Picker("Compass", selection: $showCompass) {
								Text("On").tag(true)
								Text("Off").tag(false)
								Text("Automatic").tag(nil)
							}
							Picker("Scale", selection: $showScale) {
								Text("On").tag(true)
								Text("Off").tag(false)
								Text("Automatic").tag(nil)
							}
							Toggle("Show Pitch Toggle", isOn: $showPitchToggle)
							Toggle("Show Location", isOn: $showLocation)
							Toggle("Show Zoom Buttons", isOn: $showZoomButtons)
						}
					}
				}
				.navigationTitle("Settings")
			}
		}
	}
}