import SwiftUI

struct MultilineText: View {
	@EnvironmentObject var settings: Settings
	
	var text: String
	var name: String
	init(_ text: String, _ name: String) {
		self.text = text
		self.name = name
	}
	var body: some View {
		Text(self.text)
			.font(Font.custom(name, size: Length(settings.fontSize)))
			.lineLimit(nil)
			.lineSpacing(Length(settings.lineSpacing))
			.padding(10)
	}
}

struct LoremIpsumView: View {
	@EnvironmentObject var settings: Settings
	@State var presenting: Bool = false
	var name: String
	init(name: String) {
		self.name = name
	}
	
	var latin = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mattis sit amet mauris non mattis. Nulla sagittis congue ante in ultrices. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ut erat lectus. Ut viverra nunc quis ex lacinia tempor. Vivamus feugiat lacus ut ullamcorper vehicula."
	
	var chinese = "上名表気合軽確加継家新保泉県文宗敏氏。知転能変長食界画民生差待供会論財。光抗渡第客火命会経呂心好問銭億。作剣未桂禁自示中党日中観保作遺国暮親。経期重試重名和暮足環佐派者。域勝会根省棋小在質載月海藩英日。性負北否転転護主正更気輝掲総表。止特進徴学請罰委園能張語盛摘一度探済中支。山関岐指帯送暑応新心賀報勝花義択念然問要。"
	
	var japanese = "都野等りトユフニヒ無てけ御擢個根他露リョマッケホロくらめる知知阿離個屋屋等尾派擢素えて。根けのゅ巣むくのくり、巣屋よゅはねな。み手素巣区津巣ゃ手二等のぬ根津鵜都、擢差派そち手もるれっれ。きろまらめう魔保むれけほゆ。魔差ゅるへ保御尾御手樹保うみ「キモチ」ケへあよみッケラマテアけょゆもるぬ。魔模魔かっいなち離模雲差根譜野露。"
	
	var korean = "공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다, 국무회의의 구성원으로서 국정을 심의한다. 일반사면을 명하려면 국회의 동의를 얻어야 한다. 국가유공자·상이군경 및 전몰군경의 유가족은 법률이 정하는 바에 의하여 우선적으로 근로의 기회를 부여받는다."
	
	var body: some View {
		VStack {
			List {
				MultilineText(latin, name)
				MultilineText(chinese, name)
				MultilineText(japanese, name)
				MultilineText(korean, name)
			}
		}
		.sheet(isPresented: $presenting) {
			SettingsView().environmentObject(self.settings)
		}
		.navigationBarTitle(Text(name), displayMode:.inline)
			.navigationBarItems(trailing: Button(action: { self.presenting.toggle() }) { Text("Settings") })
	}
}



