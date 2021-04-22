import SwiftUI

struct ContentView: View {
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var lineWidth: CGFloat = 3.0
    @State public var selectedColor = Color.blue

    var body: some View {
        ZStack(alignment: .bottomTrailing){
            DrawingPad(currentDrawing: $currentDrawing,
                       drawings: $drawings,
                       color: $selectedColor,
                       lineWidth: $lineWidth).edgesIgnoringSafeArea(.all)
            
            ColorPicker(
                "",
                selection: $selectedColor
            )
            .scaleEffect(CGSize(width: 1.5, height: 1.5))
            .animation(.default)
            .labelsHidden()
            .padding(.horizontal, 20)
            
            Slider(value: $lineWidth, in: 1.0...15.0, step: 1.0)
                .scaleEffect(CGSize(width: 0.9, height: 0.9))
                .padding(.trailing, 50)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
