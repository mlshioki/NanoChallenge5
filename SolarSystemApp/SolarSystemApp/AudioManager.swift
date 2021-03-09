//
//  AudioManager.swift
//  SolarSystemApp
//
//  Created by Rodrigo Ryo Aoki on 09/03/21.
//

import UIKit
import AVFoundation

enum SoundList: String {
    case button = "btnPressed"
    case backButton = "backBtn"
}

class AudioManager {
    
    var audioPlayer = AVAudioPlayer()
    
    init() {
        audioPlayer.prepareToPlay()
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
    }
    
    func play(sound: SoundList){
        let path = Bundle.main.path(forResource: sound.rawValue, ofType: "wav")!
        
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer.play()
    }
}
