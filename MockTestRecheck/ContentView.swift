//
//  ContentView.swift
//  MockTestRecheck
//
//  Created by Sabith Salman on 2024-11-26.
//

import SwiftUI

struct ContentView: View {
    @Binding var fontSize: Double
    @Binding var selectedFontColor : AppThemeColour
    var body: some View {
        TabView {
            GameView(selectedFontColor: $selectedFontColor, fontSize: $fontSize)
                .tabItem{
                    Label("Home", systemImage: "house")
                    
                }
               
            
            SettingsView(fontSize: $fontSize,selectedFontColor: $selectedFontColor)
                .tabItem{
                    Label("Settings", systemImage: "gear")
                    }
               
            
            
        }
        .tint(convertColor())
    }
    func convertColor() -> Color {
        switch selectedFontColor {
        case .red:
            return .red
        case .blue:
            return .blue
        case .green:
            return .green
        }
    }
}

#Preview {
    ContentView(fontSize: .constant(20), selectedFontColor: .constant(.red))
}
