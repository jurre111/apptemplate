import SwiftUI

struct SettingsView: View {
	@AppStorage("alwaysShowCompass") private var alwaysShowCompass: Bool = false
    @AppStorage("alwaysShowPitchToggle") private var alwaysShowPitchToggle: Bool = false
	var body: some View {
		NavigationStack {
			List {
				NavigationLink("User Interface") {
					List {
						Section("Map UI") {
							Toggle("Show Compass", isOn: $alwaysShowCompass)
							Toggle("Show Pitch Toggle", isOn: $showPitchToggle)
						}
					}
				}
			}
		}
	}
}