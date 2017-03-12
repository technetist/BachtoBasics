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

    @IBAction func btnPlay(_ sender: Any) {
        player.play()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        player.stop()
        player.currentTime = 0.0;
    }
    
    @IBAction func btnPause(_ sender: Any) {
        player.pause()
    }
    
    @IBOutlet weak var sliderTime: UISlider!
    
    @IBAction func sliderTimeMoved(_ sender: Any) {
        
    }
    
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBAction func sliderVolumeMoved(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

