//
//  VideoListView.swift
//  African Animals
//
//  Created by Myron on 12/5/21.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTY
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos)  {item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
              }//:ForEach
            }//: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .automatic)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{
                        //Shuffle Videos
                        videos.shuffle()
                        hapticImpact.impactOccurred() // cant test in simulator. only real devices
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//: Nav-View
    }
}
//MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
