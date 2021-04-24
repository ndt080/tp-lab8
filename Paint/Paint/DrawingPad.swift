import SwiftUI
import PencilKit

struct DrawingPad: UIViewRepresentable {
    @Binding var toolPickerIsActive: Bool
    @Binding var canvasView: PKCanvasView
    private let toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.backgroundColor = .white
        canvasView.isOpaque = true
        toolPicker.setVisible(toolPickerIsActive, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        toolPicker.setVisible(toolPickerIsActive, forFirstResponder: uiView)
    }
}
