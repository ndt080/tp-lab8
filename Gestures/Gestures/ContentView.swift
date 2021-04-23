import SwiftUI

struct ContentView: View {
    @State private var didLongPress: Bool = false
    @State private var scale: CGFloat = 1
    @State var rotation: Angle = .zero
    @State private var changeColor = Color.purple
    
    var body: some View {
        
        Rectangle()
            .scaleEffect(scale)
            .rotationEffect(rotation)
            .foregroundColor(changeColor)
            .frame(width: 210, height: 210, alignment: .center)
            .shadow(radius: 10)
            .animation(.default)
            .simultaneousGesture(DragGesture()
                                    .onEnded { value in
                                        changeColor = value.location.x > 0 ? Color.gray : Color.black
                                        changeColor = value.location.x < 0 ? Color.gray : Color.black
                                    }
            )
            .simultaneousGesture(TapGesture()
                                    .onEnded { _ in
                                        self.changeColor = self.changeColor == Color.purple ? Color.blue : Color.purple
                                    }
            )
            .simultaneousGesture(LongPressGesture()
                                    .onEnded { _ in
                                        self.scale = self.didLongPress == false ? 2 : 1
                                        self.didLongPress.toggle()
                                    }
            )
            .simultaneousGesture(RotationGesture()
                                    .onChanged { value in
                                        self.rotation = value
                                    }
            )
            .simultaneousGesture(MagnificationGesture()
                                    .onChanged { value in
                                        self.scale = value
                                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
