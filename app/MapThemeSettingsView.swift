import SwiftUI

struct MapThemeSettingsView: View {
    @AppStorage("mapTheme") private var mapTheme: Int = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Text("Choose Map")
                    .font(system(size: 22))
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .frame(width: 60, height: 60)
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
            Grid {
                GridRow {
                    Button {
                        mapTheme = 0
                    } label: {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(uiColor: .systemFill))
                                .frame(maxWidth: .infinity, maxHeight: 114)
                            Image(systemName: "map")     
                        }
                    }
                    Button {
                        mapTheme = 1
                    } label: {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(uiColor: .systemFill))
                                .frame(maxWidth: .infinity, maxHeight: 114)
                            Image(systemName: "map")     
                        }
                    }
                }
                GridRow {
                    Button {
                        mapTheme = 3
                    } label: {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(uiColor: .systemFill))
                                .frame(maxWidth: .infinity, maxHeight: 114)
                            Image(systemName: "map")     
                        }
                    }
                    Button {
                        mapTheme = 4
                    } label: {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color(uiColor: .systemFill))
                                .frame(maxWidth: .infinity, maxHeight: 114)
                            Image(systemName: "map")     
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}