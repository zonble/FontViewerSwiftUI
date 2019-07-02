import SwiftUI
import Combine

class Settings : BindableObject {
	var lineSpacing: Float = 2.0 {
		didSet {
			self.didChange.send(self)
		}
	}
	var fontSize: Float = 17 {
		didSet {
			self.didChange.send(self)
		}
	}
	var didChange = PassthroughSubject<Settings, Never>()
}
