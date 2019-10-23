//
//  ViewController.swift
//  02dados
//
//  Created by user159106 on 10/21/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndexLeft = 0
    var randomDiceIndexRight = 0
    
   let  diceImages = ["dice1", "dice2", "dice3", "dice4" ,"dice5", "dice6"]
    var nFaces : UInt32

    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    required init?(coder: NSCoder) {
        self.nFaces = UInt32(diceImages.count)
        super.init(coder: coder)
    }

    @IBAction func rollPressed(_ sender: UIButton) {
        self.generateRandomDices()
    }
    
    func generateRandomDices() {
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
       randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
       
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        
                        self.imageViewDiceLeft.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                            .concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                            .concatenating( CGAffineTransform(translationX: -100, y: 100))
                        
                        
                        self.imageViewDiceRight.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                            .concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                            .concatenating( CGAffineTransform(translationX: 100, y: 100))
                        self.imageViewDiceLeft.alpha = 0.0
                        self.imageViewDiceRight.alpha = 0.0
                         
                        
        }) { (completed) in
            self.imageViewDiceLeft.alpha = 1.0
            self.imageViewDiceRight.alpha = 1.0
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
               self.imageViewDiceRight.transform = CGAffineTransform.identity
            self.imageViewDiceLeft.image = UIImage(named: self.diceImages[self.randomDiceIndexLeft])
            self.imageViewDiceRight.image = UIImage(named: self.diceImages[self.randomDiceIndexRight])
                   
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            generateRandomDices()
        default:
            break
        }
    }
    
}

