//
//  MockTestRecheckApp.swift
//  MockTestRecheck
//
//  Created by Sabith Salman on 2024-11-26.
//

import SwiftUI

@main
struct MockTestRecheckApp: App {
    @State var fontSize: Double = 20.0
    @State var selectedFontColor : AppThemeColour = .red
    var body: some Scene {
        WindowGroup {
            ContentView(fontSize: $fontSize, selectedFontColor: $selectedFontColor)
        }
    }
}
