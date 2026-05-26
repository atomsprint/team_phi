import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapShowCanvas(_ sender: UIButton) {
        let width = CGFloat(Double(widthTextField.text ?? "") ?? 300)
        let height = CGFloat(Double(heightTextField.text ?? "") ?? 300)
        performSegue(withIdentifier: "toCanvas", sender: (width,height))
        
    }
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        if segue.identifier == "toCanvas",
           let nextVC = segue.destination as? CanvasViewController,
           let size = sender as? (CGFloat,CGFloat){
            nextVC.inputWidth = size.0
            nextVC.inputHeight = size.1
        }
    }
}

