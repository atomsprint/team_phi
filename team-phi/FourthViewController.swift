//
//  FourthViewController.swift
//  team-phi
//
//  Created by user on 2026/01/04.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var window_select: UIButton!
        @IBOutlet weak var door_select: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // --- ドアのメニューを作る ---
                let doorOptions = ["片開きドア","両開きドア","親子ドア","片引戸","引き違い戸","引き分け戸","引き込み戸","片折れ戸","両折れ戸","回転戸","その他"].map { name in
                        UIAction(title: name) { _ in print("\(name)を選択") }
                    }
                    door_select.menu = UIMenu(children: doorOptions)
                    door_select.showsMenuAsPrimaryAction = true
                    door_select.changesSelectionAsPrimaryAction = true
                    
                    // --- 窓のメニューを作る ---
                    let windowOptions = ["引き違い窓",
                                         "上げ下げ窓","すべり出し窓","縦滑り窓","掃き出し窓","開き窓","はめ殺し窓","その他"].map { name in
                        UIAction(title: name) { _ in print("\(name)を選択") }
                    }
                    window_select.menu = UIMenu(children: windowOptions)
                    window_select.showsMenuAsPrimaryAction = true
                    window_select.changesSelectionAsPrimaryAction = true
                    
                    // 最初に窓用ボタンだけ隠しておく
                    window_select.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func door_or_window(_ sender: UISegmentedControl) {
           switch sender.selectedSegmentIndex {
               case 0:
               door_select.isHidden = false
               window_select.isHidden = true
               case 1:
               door_select.isHidden = true
               window_select.isHidden = false
               default:
               break
           }
       }
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
