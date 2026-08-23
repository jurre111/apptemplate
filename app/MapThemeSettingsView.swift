import SwiftUI

struct MapThemeSettingsView: View {
    @AppStorage("mapTheme") private var mapTheme: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Text("Choose Map")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.secondary)
                        .symbolRenderingMode(.hierarchical)
                    // ZStack(alignment: .center) {
                    //     Circle()
                    //         .fill(Color(uiColor: .systemFill))
                    //         .frame(width: 30, height: 30)
                    //     Image(systemName: "xmark")
                    //         .forgroundColor(.secondary)
                    //         .frame(width: 16.5, height: 15.5)
                    // }
                }
            }
            List{
                Section {
                    Text("test")
                    Text("test")
                    Text("test")
                }
            }
        }
    }
}