//
//  AudioPlayer.swift
//  Restart
//
//  Created by Myron on 11/27/21.
//

import Foundation
import SwiftUI
import AVFoundation
/*
 -: AV Foundation is a full featured framework for working with time-based audiovisual media on iOS
 -: We can easily play, create, and edit movies, sound files and build powerful media functionall into
    any app using this framework
 */

//Audio property to play a sound file

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        //Error Catch Handeling
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Could not play sound ")
        }
    }
}
