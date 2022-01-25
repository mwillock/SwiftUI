//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Myron on 1/16/22.
//

import SwiftUI

struct DetailView: View {
    //MARK: - PROPERTIES
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingPresented: Bool = false
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            //HEADER
            HeaderView()
            //CONTENT
            Spacer()
            
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }//:Scroll
            //FOOTER
            HStack(alignment:.center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingPresented, content: {
                        SettingView()
                    })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            }//:HStack
            .padding()
            .foregroundColor(.secondary)
        }//:VStack
        .padding(3)
    }
}
//MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note (id: UUID(), text: "hello, world")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
