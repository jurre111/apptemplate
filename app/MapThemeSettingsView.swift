import SwiftUI

struct MapThemeSettingsView: View {
    @AppStorage("mapTheme") private var mapTheme: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Text("Choose Map")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.secondary)
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
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .fill(.ultraThickMaterial)
        }
        .padding()
    }
}