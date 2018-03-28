//
//  GameViewController.swift
//  pong
//
//  Created by SUP'Internet 15 on 23/03/2018.
//  Copyright © 2018 SUP'Internet 15. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {

    var backingAudio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let filePath = Bundle.main.path(forResource: "force", ofType: "mp3")
        let audio = NSURL(fileURLWithPath: filePath!)
        do {
            backingAudio = try AVAudioPlayer(contentsOf: audio as URL)
        } catch{
            return print("Cannot Find The Audio")
        }
        
        backingAudio.numberOfLoops = -1
        backingAudio.play()
 
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        if let view = self.view as! SKView? {
            
            // Load the SKScene from 'GameScene.sks'
            
            let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
            
            // Set the scale mode to scale to fit the window
            
            scene.scaleMode = .aspectFill
            
            // Present the scene
            
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            
            view.showsNodeCount = false
            
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
