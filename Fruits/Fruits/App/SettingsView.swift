//
//  SettingsView.swift
//  Fruits
//
//  Created by Myron on 12/4/21.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    /*
     @Environment : Great for reading CoreData Managed objects content,
        Such as dark or light mode a series of fixed properties that come from the users phone *(App invorment)
     */
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack (spacing: 20){
                    //MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingLabelView(labelText: "Fruit", labelImage: "info.circle")
                    ){
                        Divider().padding(.vertical , 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruit are naturally low in fat, sodium, and calories. None have cholestrol. Fruits are sources of many essential nutrient, including potassium dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }//:HStack
                    }
                    
                    //MARK: - SECTION 2
                    GroupBox(
                        label: SettingLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ){
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1) //Ensures required space
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding){
                            if (isOnboarding) {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                       
                        .background(
                            Color(UIColor.tertiarySystemGroupedBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    //MARK: - SECTION 3
                    
                    GroupBox(
                        label: SettingLabelView(labelText: "Appliaction", labelImage: "apps.iphone")
                    ){
                        
                        SettingRowView(name:"Developer" , content: "OG")
                        SettingRowView(name:"Designer", content: "Myron")
                        SettingRowView(name: "Compatibility" , content: "iOS 14")
                        SettingRowView(name: "Resource", linkLabel: "The Spot", linkDestination: "github.com")
                        SettingRowView(name: "SwiftUI", content: "2.0")
                        SettingRowView(name: "Version", content: "1.1.1")
                    }
                }//:VSTack
                    .navigationBarTitle(Text("Settings"), displayMode: .large)
                    .navigationBarItems(
                        trailing: Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark")
                        }
                    )
                    .padding()
            }//:ScrollView

        }//:NAV View
    }
}
//MARK: // PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
