//
//  SecondViewController.swift
//  GestureRecognizerExercise
//
//  Created by Isaac Kim on 9/11/17.
//  Copyright © 2017 Isaac Kim. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    
    var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan1(recognizer:)))
        
        squareView.addGestureRecognizer(panGesture)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func handlePan1(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translation(in: self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

