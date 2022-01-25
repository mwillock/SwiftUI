//
//  AppView.swift
//  Avocados
//
//  Created by Myron on 1/19/22.
//

import SwiftUI

struct AppView: View {
    @Environment(\.colorScheme) var colorScheme
    init() {
        UITabBar.appearance().backgroundColor = UIColor.tertiarySystemBackground
    }
    var body: some View {
        //Tab Navigation 
        TabView{
            AvocadoView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
        SettingView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
        }//:TabView
        .accentColor(Color.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
