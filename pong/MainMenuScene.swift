//
//  MainMenuScene.swift
//  pong
//
//  Created by SUP'Internet 15 on 25/03/2018.
//  Copyright © 2018. SUP'Internet 15. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    
    let startGame = SKLabelNode(fontNamed: "The Bold Font")
    let startSecondMission = SKLabelNode(fontNamed: "The Bold Font")
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let supProject = SKLabelNode(fontNamed: "The Bold Font")
        supProject.text = "A Sup'Internet"
        supProject.fontSize = 150
        supProject.fontColor = SKColor.white
        supProject.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.78)
        supProject.zPosition = 1
        self.addChild(supProject)
        
        let supProject2 = SKLabelNode(fontNamed: "The Bold Font")
        supProject2.text = "Project"
        supProject2.fontSize = 150
        supProject2.fontColor = SKColor.white
        supProject2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        supProject2.zPosition = 1
        self.addChild(supProject2)
        
        
        let gameBy = SKLabelNode(fontNamed: "The Bold Font")
        gameBy.text = "By Alexis AFONSO"
        gameBy.fontSize = 50
        gameBy.fontColor = SKColor.white
        gameBy.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.62)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        
        startGame.text = "Start Colonisation"
        startGame.name = "startLabel"
        startGame.fontSize = 100
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        startGame.zPosition = 1
        self.addChild(startGame)
        
        startSecondMission.text = "Space Destruction"
        startSecondMission.name = "startLabel2"
        startSecondMission.fontSize = 100
        startSecondMission.fontColor = SKColor.white
        startSecondMission.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.2)
        startSecondMission.zPosition = 1
        self.addChild(startSecondMission)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            
            if startGame.contains(pointOfTouch){
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            } else if startSecondMission.contains(pointOfTouch){
                let sceneToMoveTo = GameScene2(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }

            
        }
    }
}

