import UIKit

class CanvasViewController: UIViewController {
    @IBOutlet weak var canvasView: CanvasView!
    var inputWidth: CGFloat = 300
    var inputHeight: CGFloat = 300

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // canvasView自体を入力サイズに変更して中央に配置
        let x = (view.bounds.width - inputWidth) / 2
        let y = (view.bounds.height - inputHeight) / 2
        canvasView.frame = CGRect(x: x, y: y, width: inputWidth, height: inputHeight)
    }
}
