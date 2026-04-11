//
//  SecondViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var roomview: UIView!
    @IBOutlet var image1: UIView!
    @IBOutlet var image2: UIView!
    @IBOutlet var image3: UIView!
    @IBOutlet var image15: UIImageView!
    @IBOutlet var image25: UIImageView!
    @IBOutlet var image35: UIImageView!
    

   
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
        
        //roomviewに乗っているかの判定
        guard let movingview  = gesture.view else { return }
        if gesture.state == .ended {
                // movingviewたちの中心がroomviewの枠内にあるか判定
                let centerInTarget = movingview.superview?.convert(movingview.center, to: roomview) ?? .zero
                
            if roomview.bounds.contains(centerInTarget) {
                // --- 【載っていたら】 ---
                print("設置完了")
                
            }else {
                // --- 【載っていなかったら】 ---
                    print("元に戻った")
                
                //image1を戻す
            if movingview == image1{
                image1.frame = CGRect(x: 16, y: 306, width: 156, height: 95)
                view.addSubview(image1)
            }
                //image2を戻す
            if movingview == image2{
                image2.frame = CGRect(x: 212, y: 306, width: 156, height: 95)
                view.addSubview(image2)
            }
                //image3を戻す
            if movingview == image3{
                image3.frame = CGRect(x: 21, y: 409, width: 156, height: 95)
                view.addSubview(image3)
            }
                //image15を戻す
            if movingview == image15{
                image15.frame = CGRect(x: 30.5, y: 509.5, width: 95, height: 156)
                view.addSubview(image15)
            }
                //image25を戻す
            if movingview == image25{
                image25.frame = CGRect(x: 153.5, y: 509.5, width: 95, height: 156)
                view.addSubview(image25)
            }
                //image35を戻す
            if movingview == image35{
                image35.frame = CGRect(x: 278.5, y: 509.5, width: 95, height: 156)
                view.addSubview(image35)
            }
                
                
                }
            }
        
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
