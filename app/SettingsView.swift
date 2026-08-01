import SwiftUI

struct SettingsView: View {
	@AppStorage("showCompass") private var showCompass: Bool = true
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
	@AppStorage("showScale") private var showScale: Bool?
	@AppStorage("showLocation") private var showLocation: Bool = true
	@State private var searchText: String = ""
	var body: some View {
		NavigationStack {
			List {
				NavigationLink("UI Customization") {
					List {
						Section("Map UI") {
							Toggle("Compass", isOn: $showCompass)
							Picker("Scale", selection: $showScale) {
								Text("Always Shown").tag(true)
								Text("Automatic").tag(nil as Bool?)
								Text("Disabled").tag(false)
							}
							Toggle("Pitch Toggle", isOn: $showPitchToggle)
							Toggle("Location Button", isOn: $showLocation)

						}
					}
					.scrollContentBackground(.hidden)
				}
			}
			.scrollContentBackground(.hidden)
			.searchable(text: $searchText)
		}
	}
}