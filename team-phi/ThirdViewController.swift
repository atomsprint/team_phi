//
//  ThirdViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var sofa_view: UIView!
    @IBOutlet weak var bed_view: UIView!
    @IBOutlet weak var chair_view: UIView!
    @IBOutlet weak var table_view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        sofa_view.addGestureRecognizer(panGesture1)
        
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        bed_view.addGestureRecognizer(panGesture2)
        
        let panGesture3 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        chair_view.addGestureRecognizer(panGesture3)
        
        let panGesture15 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        table_view.addGestureRecognizer(panGesture15)
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
