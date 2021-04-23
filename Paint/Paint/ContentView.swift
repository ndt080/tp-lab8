import SwiftUI
import PencilKit

struct ContentView: View {
    @Environment(\.undoManager) private var undoManager
    @State private var canvasView = PKCanvasView()
    @State private var lineWidth: CGFloat = 3.0
    @State public var selectedColor = Color.blue
    var imgRect = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
    
    func saveSignature(){
        let image = canvasView.drawing.image(from: imgRect, scale: 1.0)
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: image)
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            DrawingPad(lineWidth : $lineWidth, selectedColor: $selectedColor, canvasView: $canvasView)
                .background(Color.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            HStack(alignment: .bottom){
                Button(action: {
                    self.saveSignature()
                }) {
                    Image(systemName: "square.and.arrow.down")
                        .scaleEffect(CGSize(width: 2, height: 2))
                        .padding(.bottom, 8)
                }.padding(.horizontal, 20)
                
                Slider(value: $lineWidth, in: 1.0...30.0, step: 1.0)
                    .scaleEffect(CGSize(width: 0.9, height: 0.9))
                
                ColorPicker(
                    "",
                    selection: $selectedColor
                )
                .scaleEffect(CGSize(width: 1.5, height: 1.5))
                .animation(.default)
                .labelsHidden()
                .padding(.horizontal, 20)
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
