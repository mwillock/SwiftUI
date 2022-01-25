//
//  SettingView.swift
//  Notes WatchKit Extension
//
//  Created by Myron on 1/16/22.
//

import SwiftUI

struct SettingView: View {
    //MARK: - PROPERTIES
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    //MARK: - FUNCTION
    
    func update() {
        lineCount = Int(value)
    }
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            //Actual line count
            Text("Lines :\(lineCount)".uppercased())
                .fontWeight(.bold)
            //Slider
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
        }//: VStack
    }
}
//MARK: - PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
