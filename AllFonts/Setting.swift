import SwiftUI
import Combine

@propertyWrapper
struct UserDefault<T> {
	let key: String
	let defaultValue: T

	init(_ key: String, defaultValue: T) {
		self.key = key
		self.defaultValue = defaultValue
	}

	var wrappedValue: T {
		get {
			return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
		}
		set {
			UserDefaults.standard.set(newValue, forKey: key)
		}
	}
}

class Settings : BindableObject {
	@UserDefault("lineSpacing", defaultValue: 2.0)
	var lineSpacing: Float {
		didSet {
			self.willChange.send(self)
		}
	}

	@UserDefault("fontSize", defaultValue: 17)
	var fontSize: Float {
		didSet {
			self.willChange.send(self)
		}
	}
	var willChange = PassthroughSubject<Settings, Never>()
}
