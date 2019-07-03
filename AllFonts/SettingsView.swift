import SwiftUI

struct SettingsView : View {
	@EnvironmentObject var settings: Settings
	var body: some View {
		NavigationView {
			List {
				Section {
					Text("Font Size: \(Int(settings.fontSize)) pt")
					HStack {
						Text("12 pt")
						Slider(value: $settings.fontSize, from: 12, through: 30, by: 1)
						Text("24 pt")
					}
				}
				Section {
					Text("Line Spacing: \(Int(settings.lineSpacing)) pt")
					HStack {
						Text("0 pt")
						Slider(value: $settings.lineSpacing, from: 0.0, through: 10.0, by: 1.0)
						Text("10 pt")
					}
				}
			}.listStyle(.grouped)
			.navigationBarTitle("Preview Settings", displayMode: .inline)
		}
	}
}

#if DEBUG
struct SettingsView_Previews : PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
#endif


