import SwiftUI

struct ContentView : View {
	var settings = Settings()

    var body: some View {
		NavigationView {
			List(UIFont.familyNames.sorted().identified(by: \.self)) { name in
				NavigationButton(destination: LoremIpsumView(name: name)) {
				Text(name)
					.font(Font.custom(name, size: 24))
					.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
				}
			}.navigationBarTitle(Text("Font Viewer"))
		}.environmentObject(settings)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
