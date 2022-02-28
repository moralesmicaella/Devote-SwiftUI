//
//  SoundPlayer.swift
//  Devote
//
//  Created by Micaella Morales on 2/28/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let url = Bundle.main.url(forResource: sound, withExtension: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print("Could not find and play the sound file.")
    }
  }
}
