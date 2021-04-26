import SwiftUI

struct ContentView: View {
    @State private var didLongPress: Bool = false
    @State public var drag: CGSize = .zero
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
            .offset(drag)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        self.drag = value.translation
                    }
                    .onEnded({ _ in
                        self.drag = .zero
                    })
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
