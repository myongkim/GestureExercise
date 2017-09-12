//
//  FirstViewController.swift
//  GestureRecognizerExercise
//
//  Created by Isaac Kim on 9/11/17.
//  Copyright © 2017 Isaac Kim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pandaImage: UIImageView!
    
    @IBOutlet weak var pandaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pandaImage.isUserInteractionEnabled = true
        
    
        let panGuesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(recognizer:)))
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        
        
        pandaImage.gestureRecognizers = [panGuesture, tapGesture, rotateGesture, pinchGesture]
    
    }
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer){
        let height = UInt32(self.view.frame.height)
        let width = UInt32(self.view.frame.width)
        let randomNumberx = arc4random_uniform(width) + 0
        let randomNumbery = arc4random_uniform(height) + 0
        let randomPostion = CGPoint(x: CGFloat(width - randomNumberx), y: CGFloat(height - randomNumbery))
        pandaImage.center = randomPostion
        pandaLabel.text = "Come on Dragon~~~!"
        
    }
    
    func handleRotation(recognizer: UIRotationGestureRecognizer){
        if let view = recognizer.view{
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
        
    }
    
    func handlePinch(recognizer: UIPinchGestureRecognizer){
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y:recognizer.scale)
            recognizer.scale = 1
        
        }
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

