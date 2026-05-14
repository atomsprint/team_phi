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
}
