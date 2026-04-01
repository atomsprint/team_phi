//
//  SecondViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var image1: UIView!
    @IBOutlet weak var image2: UIView!
    @IBOutlet weak var image3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image1.addGestureRecognizer(panGesture1)
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image2.addGestureRecognizer(panGesture2)
        let panGesture3 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image3.addGestureRecognizer(panGesture3)
    }
    
    
    @objc func handlepan(_ gesture:UIPanGestureRecognizer) {
        let translation = gesture.translation(in:view)
        
        if let gestureView = gesture.view{
            gestureView.center = CGPoint(
                x: gestureView.center.x + translation.x,
                y: gestureView.center.y + translation.y
            )
        }
        
        gesture.setTranslation(.zero, in: view)
    }


}
