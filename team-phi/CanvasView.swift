import UIKit

// 描画モードの定義（線 vs 四角）
enum DrawingMode {
    case line
    case rectangle
}

class CanvasView: UIView {
    
    // 現在の描画モード（デフォルトは線）
    var currentMode: DrawingMode = .line
    
    // 現在描画中のパス
    private var currentPath: UIBezierPath?
    
    // 描画された図形を保存する配列
    private var shapes: [(path: UIBezierPath, color: UIColor, mode: DrawingMode)] = []
    
    // 現在の色（デフォルトは黒）
    private var currentColor: UIColor = .black
    
    // タッチ開始地点（四角形描画用）
    private var startPoint: CGPoint?
    
    // UIViewの初期化（コードから生成する場合）
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // Storyboardから生成する場合に必要
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // 初期設定
    private func setup() {
        backgroundColor = .white
        // タッチイベントを受け取るために必須
        isUserInteractionEnabled = true
    }
    
    // 実際の描画処理（このメソッドが自動で呼ばれる）
    override func draw(_ rect: CGRect) {
        // すでに描画済みの図形を描く
        for shape in shapes {
            shape.color.setStroke()
            
            if shape.mode == .rectangle {
                // 四角形は半透明で塗りつぶし
                shape.color.withAlphaComponent(0.3).setFill()
                shape.path.fill()
            }
            
            shape.path.lineWidth = 3.0
            shape.path.stroke()
        }
        
        // 現在描画中のパスも描画
        if let path = currentPath {
            currentColor.setStroke()
            
            if currentMode == .rectangle {
                currentColor.withAlphaComponent(0.3).setFill()
                path.fill()
            }
            
            path.lineWidth = 3.0
            path.stroke()
        }
    }

    // タッチ開始：指が画面に触れた時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        // タッチ地点を記録
        startPoint = touch.location(in: self)
        
        // 新しい描画パスを開始
        currentPath = UIBezierPath()
        currentPath?.move(to: startPoint!)
    }
    
    // タッチ移動：指を動かしている時（これがないと描画されない）
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
              let start = startPoint else { return }
        
        let currentPoint = touch.location(in: self)
        
        if currentMode == .line {
            // 【線モード】今の地点まで線を追加
            currentPath?.addLine(to: currentPoint)
        } else {
            // 【四角モード】開始点から現在地点までの矩形を作成
            let rect = CGRect(
                x: min(start.x, currentPoint.x),
                y: min(start.y, currentPoint.y),
                width: abs(currentPoint.x - start.x),
                height: abs(currentPoint.y - start.y)
            )
            // 四角形は毎回新しく作り直す（サイズが変わるため）
            currentPath = UIBezierPath(rect: rect)
        }
        
        // 画面を再描画（これがないと表示されません！）
        setNeedsDisplay()
    }
    
    // タッチ終了：指を離した時
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let path = currentPath else { return }
        
        // 描画した図形を配列に保存（これで確定）
        shapes.append((path: path, color: currentColor, mode: currentMode))
        
        // 現在のパスをリセット
        currentPath = nil
        
        // 再描画
        setNeedsDisplay()
    }
    
    // 描画色を変更
    func setColor(_ color: UIColor) {
        currentColor = color
    }
    
    // 描画モードを変更（線 ↔ 四角）
    func setMode(_ mode: DrawingMode) {
        currentMode = mode
    }
    
    // 全ての描画をクリア
    func clear() {
        shapes.removeAll()
        currentPath = nil
        setNeedsDisplay()
    }
    
    // 最後に描画した図形を元に戻す（Undo）
    func undo() {
        guard !shapes.isEmpty else { return }
        shapes.removeLast()
        setNeedsDisplay()
    }
}
