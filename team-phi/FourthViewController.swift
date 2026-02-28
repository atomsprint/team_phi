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
    @IBOutlet weak var door_add: UIButton!
    @IBOutlet weak var window_add: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // --- ドアのメニュー ---
        let doorOptions = ["片開きドア", "両開きドア", "親子ドア", "片引戸", "引き違い戸", "引き分け戸", "引き込み戸", "片折れ戸", "両折れ戸", "回転戸", "その他"].map { name in
            UIAction(title: name, handler: { _ in print("\(name)を選択") })
        }

        door_select.menu = UIMenu(children: doorOptions)
        door_select.showsMenuAsPrimaryAction = true
        door_select.changesSelectionAsPrimaryAction = true
                    
                    // --- 窓のメニュー ---
                    let windowOptions = ["引き違い窓",
                                         "上げ下げ窓","すべり出し窓","縦滑り窓","掃き出し窓","開き窓","はめ殺し窓","その他"].map { name in
                        UIAction(title: name) { _ in print("\(name)を選択") }
                    }
                    window_select.menu = UIMenu(children: windowOptions)
                    window_select.showsMenuAsPrimaryAction = true
                    window_select.changesSelectionAsPrimaryAction = true
                    
                    // 最初に窓用ボタンだけ隠しておく
                    window_select.isHidden = true
                    window_add.isHidden = true
        // Do any additional setup after loading the view.
    }
    //セグメンテッドコントロール　ドア・まど
    @IBAction func door_or_window(_ sender: UISegmentedControl) {
           switch sender.selectedSegmentIndex {
               //ドアを出す
               case 0:
               door_select.isHidden = false
               door_add.isHidden = false
               window_select.isHidden = true
               window_add.isHidden = true
               //窓を出す
               case 1:
               door_select.isHidden = true
               door_add.isHidden = true
               window_select.isHidden = false
               window_add.isHidden = false
               default:
               break
           }
       }
    //追加ボタン　ドア
    @IBAction func door_add(_ sender: UIButton) {
        let selectedTitle = door_select.titleLabel?.text ?? ""
         //ドアのview設定用
        let newview = UIView()
            //ケース別
            switch selectedTitle {
        case"片開きドア":
        //1:1
                newview.frame = CGRect(x: 50, y: 200, width: 60, height: 60)
                newview.backgroundColor = .brown
        case"両開きドア":
                //1:4
                newview.frame = CGRect(x: 50, y: 200, width: 60, height: 240)
                newview.backgroundColor = .brown
        case"親子ドア":
                //2:3
                newview.frame = CGRect(x: 50, y: 200, width: 120, height: 180)
                newview.backgroundColor = .brown
        case"片引き戸":
                //1:2
                newview.frame = CGRect(x: 50, y: 200, width: 10, height: 120)
                newview.backgroundColor = .brown
        case"引き違い戸":
                //1:2
                newview.frame = CGRect(x: 50, y: 200, width: 10, height: 120)
                newview.backgroundColor = .brown
        case"引き分け戸":
                //1:4
                newview.frame = CGRect(x: 50, y: 200, width: 10, height: 240)
                newview.backgroundColor = .brown
        case"引き込み戸":
                //1:1
                newview.frame = CGRect(x: 50, y: 200, width: 10, height: 60)
                newview.backgroundColor = .brown
        case"片折れ戸":
                //1:2
                newview.frame = CGRect(x: 50, y: 200, width: 60, height: 120)
                newview.backgroundColor = .brown
        case"両折れ戸":
                //1:4
                newview.frame = CGRect(x: 50, y: 200, width: 60, height: 240)
                newview.backgroundColor = .brown
        case"回転戸":
                //1:1
                newview.frame = CGRect(x: 50, y: 200, width: 120, height: 120)
                newview.backgroundColor = .brown
        case"その他":
                //1:4
                newview.frame = CGRect(x: 50, y: 200, width: 120, height: 120)
                newview.backgroundColor = .brown
            default:
            break
            }
                // 文字のラベル
                let label = UILabel()
                label.text = selectedTitle
            // ポップアップで選んだ文字を入れる
        label.frame = CGRect(x: 0, y: 0, width: newview.frame.width, height: 30) // ラベルのサイズ
                label.textAlignment = .center // 文字を真ん中に寄せる
            label.textColor = .black // 文字の色を黒にする
                
                // ラベルをViewに乗せる
                newview.addSubview(label)
                
                
                // Viewを画面に出す
                self.view.addSubview(newview)

        
    }
    //追加ボタン　まど
    @IBAction func window_add(_ sender: UIButton) {
        let selectedTitle = window_select.titleLabel?.text ?? ""
        //ドアのview設定用
        let newview = UIView()
        // 文字のサイズなど
        newview.frame = CGRect(x: 50, y: 200, width: newview.frame.width, height: 30)
        newview.backgroundColor = .brown
        
        // 文字のラベル
        let label = UILabel()
        label.text = selectedTitle // ポップアップで選んだ文字を入れる
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 30) // ラベルのサイズ
        label.textAlignment = .center // 文字を真ん中に寄せる
        label.textColor = .white // 文字の色を白にする
        
        // ラベルをViewに乗せる
        newview.addSubview(label)
        
        // Viewを画面に出す
        self.view.addSubview(newview)
            //ケース別
            switch selectedTitle {
        case"引き違い窓":
                //0:1
                newview.frame = CGRect(x: 50, y: 200, width: 5, height: 80)
                newview.backgroundColor = .cyan
        case"上げ下げ窓":
                //0:1
                newview.frame = CGRect(x: 50, y: 200, width: 5, height: 80)
                newview.backgroundColor = .cyan
        case"滑り出し窓":
                //1:1
                newview.frame = CGRect(x: 50, y: 200, width: 80, height: 80)
                newview.backgroundColor = .cyan
        case"縦滑り窓":
                //1:1
                newview.frame = CGRect(x: 50, y: 200, width: 80, height: 80)
                newview.backgroundColor = .cyan
        case"掃き出し窓":
                //0:1
                newview.frame = CGRect(x: 50, y: 200, width: 5, height: 80)
                newview.backgroundColor = .cyan
        case"開き窓":
                //1:1
                newview.frame = CGRect(x: 50, y: 200, width: 80, height: 80)
                newview.backgroundColor = .cyan
        case"はめ殺し窓":
                //0:0
                newview.frame = CGRect(x: 50, y: 200, width: 5, height: 80)
                newview.backgroundColor = .cyan
        case"その他":
                //1:4
                newview.frame = CGRect(x: 50, y: 200, width: 5, height: 80)
                newview.backgroundColor = .cyan
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
