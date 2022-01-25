//
//  VideoPlayerVi.swift
//  African Animals
//
//  Created by Myron on 12/13/21.
//

import SwiftUI
import AVKit
struct VideoPlayerView: View {
    //MARK: - PROPERTIES
    
    var videoSelected: String
    var videoTitle: String
    //MARK: - BODY
    var body: some View {
        //Video Player Design
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")){
                //Text(videoTitle)
                
            }//:Video
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,alignment: .topLeading
            )
        }//:VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}
//MARK: - PREVIEWS
struct VideoPlayerVi_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }//:NAV View
    }
}
