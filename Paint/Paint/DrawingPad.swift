import SwiftUI
import PencilKit

struct DrawingPad: UIViewRepresentable {
    @Binding var lineWidth: CGFloat
    @Binding var selectedColor : Color
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: UIColor(selectedColor), width: lineWidth)
        return canvasView
    }
    
    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        canvasView.tool = PKInkingTool(.pen, color: UIColor(selectedColor), width: lineWidth)
    }
}
