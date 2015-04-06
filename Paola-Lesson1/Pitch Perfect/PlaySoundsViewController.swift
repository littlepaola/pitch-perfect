//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Paola Di Marcello on 05/04/15.
//  Copyright (c) 2015 GE. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController{
 
    var audioPlayer:AVAudioPlayer!
    var recordedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine=AVAudioEngine()
        audioPlayer = AVAudioPlayer(contentsOfURL: recordedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate=true;
        audioFile=AVAudioFile(forReading: recordedAudio.filePathUrl, error: nil)
    }

    @IBAction func stopAudio(sender: UIButton) {
         audioPlayer.stop()
        audioEngine.stop()
    }
    @IBAction func playSlow(sender: UIButton) {
        audioPlayer.rate=0.5;
        audioPlayer.play();
    }
    
    @IBAction func playFast(sender: UIButton) {
        audioPlayer.rate=2.0
        audioPlayer.play()
    }
    
    @IBAction func playChipmunk(sender: UIButton) {
        playPitch(1000)
    }

    @IBAction func playDarthVader(sender: UIButton) {
        playPitch(-1000)
    }
    
    func playPitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var pitchPlayer = AVAudioPlayerNode()
        audioEngine.attachNode(pitchPlayer)
        
        var timePitch = AVAudioUnitTimePitch()
        timePitch.pitch = pitch
        audioEngine.attachNode(timePitch)
        
        audioEngine.connect(pitchPlayer, to: timePitch, format: nil)
        audioEngine.connect(timePitch, to: audioEngine.outputNode, format: nil)
        
        pitchPlayer.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        pitchPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
