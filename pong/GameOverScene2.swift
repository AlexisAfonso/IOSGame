//
//  GameOverScene.swift
//  pong
//
//  Created by SUP'Internet 15 on 24/03/2018.
//  Copyright © 2018. SUP'Internet 15. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene2: SKScene{
    
    let restartLabel = SKLabelNode(fontNamed: "The Bold Font")
    let mainMenu = SKLabelNode(fontNamed: "The Bold Font")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        
        //Petit Bug d'affichage du Game Over sur Emulator
        let gameOverLabel = SKLabelNode(fontNamed: "The Bold Font")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 200
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "The Bold Font")
        scoreLabel.text = "Score: \(gameScore2)"
        scoreLabel.fontSize = 125
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        let defaults2 = UserDefaults()
        var highScoreNumber2 = defaults2.integer(forKey: "highScoreSaved2")
        
        if gameScore2 > highScoreNumber2{
            highScoreNumber2 = gameScore2
            defaults2.set(highScoreNumber2, forKey: "highScoreSaved2")
        }
        
        let highScoreLabel2 = SKLabelNode(fontNamed: "The Bold Font")
        highScoreLabel2.text = "High Score: \(highScoreNumber2)"
        highScoreLabel2.fontSize = 125
        highScoreLabel2.fontColor = SKColor.white
        highScoreLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        highScoreLabel2.zPosition = 1
        self.addChild(highScoreLabel2)
        
        restartLabel.text = "Restart"
        restartLabel.fontSize = 90
        restartLabel.fontColor = SKColor.white
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        restartLabel.zPosition = 1
        self.addChild(restartLabel)
        
        
        mainMenu.text = "Return to Menu"
        mainMenu.fontSize = 90
        mainMenu.fontColor = SKColor.white
        mainMenu.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        mainMenu.zPosition = 1
        self.addChild(mainMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            
            if restartLabel.contains(pointOfTouch){
                let sceneToMoveTo = GameScene2(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            } else if mainMenu.contains(pointOfTouch){
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
        }
    }
    
}