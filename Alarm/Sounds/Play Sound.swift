//
//  Play Sound.swift
//  Alarm
//
//  Created by Yery Castro on 4/7/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer? = AVAudioPlayer()

func playSound(sound: String, type: String = "", volume: Float = 1.0) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // SET the volume
            audioPlayer?.setVolume(volume, fadeDuration: 0.1)
            
            // PLAY the sound
            audioPlayer?.play()
        } catch {
            print("AUDIO ERROR")
        }
    }
}

func stopPlaying() {
    audioPlayer?.stop()
}
