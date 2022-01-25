//
//  VideoPlayerHelper.swift
//  African Animals
//
//  Created by Myron on 12/13/21.
//

import Foundation
import AVKit

/*
 Creating a video player property and function. That will enable use use this file to play videos dynamically 
 */
var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer{
    
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil{
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
