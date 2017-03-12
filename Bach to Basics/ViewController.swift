//
//  ViewController.swift
//  Bach to Basics
//
//  Created by Adrien Maranville on 3/11/17.
//  Copyright © 2017 Adrien Maranville. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
    var timer = Timer()
    
    var endMin = 0
    var endSec = 0
    
    var currentMin = 0
    var currentSec = 0
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    
    @IBOutlet weak var lblEndTime: UILabel!
    
    func updateScrubber() {
        sliderTime.value = Float(player.currentTime)
        
        currentMin = Int(player.currentTime)%3600/60
        currentSec = Int(player.currentTime)%60
        
        lblCurrentTime.text = String(format:"%02d:%02d", currentMin, currentSec)
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    
    @IBAction func btnStop(_ sender: Any) {
        player.stop()
        player.currentTime = 0.0
        lblCurrentTime.text = "00:00"
        sliderTime.value = 0
        timer.invalidate()
    }
    
    @IBAction func btnPause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBOutlet weak var sliderTime: UISlider!
    
    @IBAction func sliderTimeMoved(_ sender: Any) {
        player.currentTime = TimeInterval(sliderTime.value)
    }
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBAction func sliderVolumeMoved(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            sliderTime.maximumValue = Float(player.duration)
            
            
            
            endMin = Int(player.duration)%3600/60
            endSec = Int(player.duration)%60
            
            lblEndTime.text = String(format:"%02d:%02d", endMin, endSec)
            
            
        }
        catch {
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

