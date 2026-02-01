import UIKit

enum DrawingMode {
    case line
    case rectangle
}

class CanvasView: UIView {
    
    var currentMode: DrawingMode = .line
    
    private var currentPath: UIBezierPath?
    
    private var shapes: [(path: UIBezierPath, color: UIColor, mode: DrawingMode)] = []
    
    private var currentColor: UIColor = .black
    
    private var startPoint: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        isUserInteractionEnabled = true
    }
    

    override func draw(_ rect: CGRect) {

        for shape in shapes {
            shape.color.setStroke()
            
            if shape.mode == .rectangle {
                shape.color.withAlphaComponent(0.3).setFill()
                shape.path.fill()
            }
            
            shape.path.lineWidth = 3.0
            shape.path.stroke()
        }
        
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        startPoint = touch.location(in: self)
        
        currentPath = UIBezierPath()
        currentPath?.move(to: startPoint!)
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first,
              let start = startPoint else { return }
        
        let currentPoint = touch.location(in: self)
        
        if currentMode == .line {
            currentPath?.addLine(to: currentPoint)
        } else {
            let rect = CGRect(
                x: min(start.x, currentPoint.x),
                y: min(start.y, currentPoint.y),
                width: abs(currentPoint.x - start.x),
                height: abs(currentPoint.y - start.y)
            )
            
            currentPath = UIBezierPath(rect: rect)
        }
        
        setNeedsDisplay()
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let path = currentPath else { return }
        
        shapes.append((path: path, color: currentColor, mode: currentMode))

        currentPath = nil
        
        setNeedsDisplay()
    }
    
    func setColor(_ color: UIColor) {
        currentColor = color
    }
    
    func setMode(_ mode: DrawingMode) {
        currentMode = mode
    }
    
    func clear() {
        shapes.removeAll()
        currentPath = nil
        setNeedsDisplay()
    }
    
    func undo() {
        guard !shapes.isEmpty else { return }
        shapes.removeLast()
        setNeedsDisplay()
    }
}
