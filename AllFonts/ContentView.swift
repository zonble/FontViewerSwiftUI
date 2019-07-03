import SwiftUI

struct RootView : View {
	var settings = Settings()

    var body: some View {
		NavigationView {
			VStack {
				List(UIFont.familyNames.sorted().identified(by: \.self)) { name in
					NavigationLink(destination: LoremIpsumView(name: name).environmentObject(self.settings) ) {
						VStack(alignment: HorizontalAlignment.leading) {
						Text(name)
						.font(Font.custom(name, size: 20))
						.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
						Text("(\(name))")
						.font(Font.caption)
						.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
						}
					}
				}
			}.navigationBarTitle(Text("Font Viewer"))
		}
    }
}

#if DEBUG
struct RootView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
