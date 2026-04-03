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
        
        let dragView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
                dragView.backgroundColor = .systemBlue
                dragView.isUserInteractionEnabled = true
                view.addSubview(dragView)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragView(_:)))
                dragView.addGestureRecognizer(panGesture)
            }

            @objc func dragView(_ sender: UIPanGestureRecognizer) {
                guard let targetView = sender.view else { return }
                
                let translation = sender.translation(in: view)
                
                targetView.center = CGPoint(
                    x: targetView.center.x + translation.x,
                    y: targetView.center.y + translation.y
                )
                
                sender.setTranslation(.zero, in: view)
            }
        }

