import SwiftUI

struct SettingsView : View {
	@EnvironmentObject var settings: Settings
	var body: some View {
		List {
			Section(header: Text("Preview Settings")) {
				HStack {
					Text("Font Size:")
					Spacer()
					HStack {
						Text("12")
						Slider(value: $settings.fontSize, from: 12, through: 30, by: 1)
						Text("24")
					}.frame(width: 200)
				}
				HStack {
					Text("Line Spacing:")
					Spacer()
					HStack {
						Text("0")
						Slider(value: $settings.lineSpacing, from: 0.0, through: 10.0, by: 1.0)
						Text("10")
					}.frame(width: 200)
				}
			}
			}.listStyle(.grouped)
			.navigationBarTitle(Text("Settings"), displayMode:.inline)
	}
}

#if DEBUG
struct SettingsView_Previews : PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
#endif


