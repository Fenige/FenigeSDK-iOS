//
//  AppDelegate.swift
//  FenigeSDKExample
//
//  Created by Dmytro Onyshchuk on 30.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		loadWindow()
		return true
	}
	
	private func loadWindow() {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: MainVC())
		window?.makeKeyAndVisible()
	}
	
}
