//
//  AudioManagerViewModel.swift
//  Football Chants
//
//  Created by Josymarss on 31/12/24.
//

import Foundation
import AVKit

class AudioManagerViewModel {
    private var chantAudio: AVAudioPlayer?
    
    func playback(_ team:Team){
        if team.isPlaying {
            chantAudio?.stop()
        }else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
                    
            let url = URL(fileURLWithPath: path)
            do {
                chantAudio = try AVAudioPlayer(contentsOf:url)
                chantAudio?.numberOfLoops = -1
                chantAudio?.play()
            } catch {
                print(error)
            }
        }
    }
}
