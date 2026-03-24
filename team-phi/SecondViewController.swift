//
//  SecondViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var image: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image.addGestureRecognizer(panGesture)
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
