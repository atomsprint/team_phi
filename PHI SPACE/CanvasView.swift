import UIKit

class CanvasView: UIView {
    
    private var startPoint: CGPoint?        // 開始地点を保持
    private var currentLayer: CAShapeLayer? // プレビュー用レイヤー
    private var finishedLayers: [CAShapeLayer] = [] // 確定した線のレイヤー群
    
    private let lineColor = UIColor.black
    private let lineWidth: CGFloat = 3.0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        startPoint = touch.location(in: self)
        
        // プレビュー用の空レイヤーを作成
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        self.layer.addSublayer(shapeLayer)
        currentLayer = shapeLayer
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
              let start = startPoint,
              let layer = currentLayer else { return }
        
        let currentPoint = touch.location(in: self)
        
        // 開始点→現在点の直線をプレビュー表示（毎回更新）
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: currentPoint)
        layer.path = path.cgPath
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
              let start = startPoint,
              let layer = currentLayer else { return }
        
        let endPoint = touch.location(in: self)
        
        // 確定した直線をレイヤーに描画
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: endPoint)
        layer.path = path.cgPath
        
        // 確定済みリストに追加
        finishedLayers.append(layer)
        
        startPoint = nil
        currentLayer = nil
    }
    
    // キャンバスをクリアしたい場合
    func clearCanvas() {
        finishedLayers.forEach { $0.removeFromSuperlayer() }
        finishedLayers.removeAll()
        currentLayer?.removeFromSuperlayer()
        currentLayer = nil
    }
}

//import UIKit

//class CanvasView: UIView{
//    private var currentPath: UIBezierPath?
//    private var currentLayer: CAShapeLayer?
//    private let lineColor = UIColor.black
//    private let lineWidth: CGFloat = 3.0
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        guard let touch = touches.first else {return}
//        let point = touch.location(in: self)
//        let path = UIBezierPath()
//        path.move(to: point)
//        currentPath = path
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        shapeLayer.strokeColor = lineColor.cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = lineWidth
//        shapeLayer.lineCap = .round
//        shapeLayer.lineJoin = .round
        
//        self .layer.addSublayer(shapeLayer)
//        currentLayer = shapeLayer
//    }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
//       guard let touch = touches.first,
//        let path = currentPath else {return}
//        let point = touch.location(in: self)
//        path.addLine(to: point)
//        currentLayer?.path = path.cgPath
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
//        currentPath = nil
//        currentLayer = nil
//    }
    
//}
