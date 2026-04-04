//
//  SecondViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var image1: UIView!
    @IBOutlet weak var image2: UIView!
    @IBOutlet weak var image3: UIView!
    @IBOutlet weak var image15: UIImageView!
    @IBOutlet weak var image25: UIImageView!
    @IBOutlet weak var image35: UIImageView!
    

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image1.addGestureRecognizer(panGesture1)
       
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image2.addGestureRecognizer(panGesture2)
       
        let panGesture3 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image3.addGestureRecognizer(panGesture3)
      
        let panGesture15 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image15.addGestureRecognizer(panGesture15)
      
        let panGesture25 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image25.addGestureRecognizer(panGesture25)
        
        let panGesture35 = UIPanGestureRecognizer(target: self, action: #selector(handlepan(_:)))
        image35.addGestureRecognizer(panGesture35)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinchGesture.delegate = self
    
        // image1用
        let pinch1 = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch1.delegate = self
        image1.addGestureRecognizer(pinch1)
        
        // image2用
        let pinch2 = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch2.delegate = self
        image2.addGestureRecognizer(pinch2)
        
        // image3用
        let pinch3 = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch3.delegate = self
        image3.addGestureRecognizer(pinch3)
        // image15用
        let pinch15 = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch15.delegate = self
        image15.addGestureRecognizer(pinch15)

        // image25用
        let pinch25 = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch25.delegate = self
        image25.addGestureRecognizer(pinch25)

        // image35用
        let pinch35 = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch35.delegate = self
        image35.addGestureRecognizer(pinch35)
        // image15に対してピンチ機能を有効にする
        image15.addGestureRecognizer(pinchGesture)
        image25.addGestureRecognizer(pinchGesture)
        image35.addGestureRecognizer(pinchGesture)
        image15.transform = CGAffineTransform(rotationAngle: .pi / 2)
        image25.transform = CGAffineTransform(rotationAngle: .pi / 2)
        image35.transform = CGAffineTransform(rotationAngle: .pi / 2)
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
    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        if let gestureView = gesture.view {
            // 現在の形（回転など）を維持したまま、指の動きに合わせて拡大縮小する
            gestureView.transform = gestureView.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            // 倍率の計算をリセットする（重要！）
            gesture.scale = 1.0
            print("ピンチアップっされました")
        }
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }

}
