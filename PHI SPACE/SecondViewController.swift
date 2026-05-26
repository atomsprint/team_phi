import UIKit

class SecondViewController: UIViewController {

    
    // var calculatehight : Float?
    
    @IBOutlet weak var widthtextField: UITextField!
    @IBOutlet weak var highttextField: UITextField!
    @IBOutlet weak var shape: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rect(_ sender: UIButton) {
        // calculatehight = 234
        // 背景色がlight modeならwhite、dark modeならblackにする。
        view.backgroundColor = .systemBackground
        let texthight = CGFloat( Double(highttextField.text ?? "") ?? 300)
        let textwidth = CGFloat( Double(widthtextField.text ?? "") ?? 300)
        // func calculatehight(texthight: Double, textwidth: Double) -> Double{
            // return (360 / textwidth) * texthight
        // }
        let calculatehight = (360 / textwidth) * texthight
        shape.frame = CGRect(x: 20, y: 290, width: 360, height: calculatehight)
        // 四角形の背景色を設定
        shape.backgroundColor = .gray
        
        // 四角形をビューの中央に配置
        // square.center = view.center
        
        // 四角形をビューに追加
        view.addSubview(shape)
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        // 1. アラートの器（タイトルとメッセージ）を作る
        let alert = UIAlertController(
            title: "確認",
            message: "このサイズでいいですか",
            preferredStyle: .alert
        )
        
        //2. OKボタンの処理
        let okAction = UIAlertAction(title: "はい", style: .default) { _ in
            // 1. ストーリーボードから次の画面を取得（Storyboard IDを設定しておく必要があります）
            if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "shapeViewcontroller") {
                
                // 2-A. 下から上にポップアップ表示したい場合（Modal）
                // self.present(nextVC, animated: true, completion: nil)
                
                // 2-B. 横からスライドして進みたい場合（NavigationControllerを使っている場合）
                 self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
        
        // キャンセルボタンの処理
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { _ in
            // キャンセルされた時に背景色を白にする
            self.shape.backgroundColor = .white
        }
        
        // 4. アラートにボタンを追加する
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        // 5. 画面にアラートを表示する
        present(alert, animated: true, completion: nil)
    }
}

