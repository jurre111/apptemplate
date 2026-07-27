import SwiftUI

struct SettingsView: View {
	@AppStorage("alwaysShowCompass") private var alwaysShowCompass: Bool = false
    @AppStorage("showPitchToggle") private var showPitchToggle: Bool = false
	var body: some View {
		NavigationStack {
			List {
				NavigationStack("User Interface") {
					List {
						Section("Map UI") {
							Toggle("Show Compass", onChange: $alwaysShowCompass)
							Toggle("Show Pitch Toggle", onChange: $showPitchToggle)
						}
					}
				}
			}
		}
	}
}