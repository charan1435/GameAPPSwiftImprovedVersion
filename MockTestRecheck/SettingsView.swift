//
//  SettingsView.swift
//  MockTestRecheck
//
//  Created by Sabith Salman on 2024-11-26.
//

import SwiftUI

enum AppThemeColour: String, CaseIterable {
    case red = "Red"
    case blue = "Blue"
    case green = "Green"
}

struct SettingsView: View {
    @Binding var fontSize: Double
    @Binding var selectedFontColor : AppThemeColour
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Font Size :( \(String(format:"%.2f",fontSize)) )")
                
                Slider(value: $fontSize,in:0...100, step: 1){
                    
                    
                }
                HStack{
                    Text("Select System Color:")
                    Picker("", selection: $selectedFontColor){
                        ForEach(AppThemeColour.allCases, id: \.self){
                            color in
                            Text(color.rawValue)
                        }
                        
                    }
                    .pickerStyle(.wheel)
                    Rectangle()
                        .fill(colorForSelectedTheme())
                        .frame(width: 30,height: 30)
                        
                    
                    
                    
                }
                .padding()
                Spacer()
                
            }
            .padding()
            .navigationTitle("Settings")
            
        }
        
    }
    // Function to map enum to corresponding Color
        func colorForSelectedTheme() -> Color {
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
    SettingsView(fontSize: .constant(20.0), selectedFontColor: .constant(.red))
}
