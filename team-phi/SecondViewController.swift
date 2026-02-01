//
//  SecondViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dragView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        dragView.addGestureRecognizer(panGesture)
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you w
     ill often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
