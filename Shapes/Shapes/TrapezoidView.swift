import SwiftUI

struct TrapezoidView: View {
    @State public var animateScale = false
    @State public var didLongPress: Bool = false
    @State public var drag: CGSize = .zero
    @State public var scale: CGFloat = 1
    @State public var changeColor: Color = Color.yellow
    @State var rotation: Angle = .zero
    
    let gradient = Gradient(colors: [.green, .blue])
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        Path { path in
            path.move(to: CGPoint(x: self.screenWidth/2-100, y: 0))
            path.addLine(to: CGPoint(x: self.screenWidth/2+100, y: 0))
            path.addLine(to: CGPoint(x: self.screenWidth/2+150, y: 150))
            path.addLine(to: CGPoint(x: self.screenWidth/2-150, y: 150))
        }.fill(changeColor)
        .padding(.vertical, 10)
        .shadow(radius: 10)
        .rotationEffect(rotation)
        .scaleEffect(animateScale ? 0.5 : 1.0)
        .opacity(animateScale ? 0.2 : 1.0)
        .animation(.easeInOut(duration: 1.0))
        .offset(drag)
        .onTapGesture {
            self.animateScale.toggle()
        }
        .simultaneousGesture(
            DragGesture()
                .onChanged { value in
                    self.drag = value.translation
                }
                .onEnded({ _ in
                    self.drag = .zero
                })
        )
        
        .simultaneousGesture(
            LongPressGesture()
                .onEnded { _ in
                    self.changeColor = self.didLongPress == false ? Color.purple : Color.yellow
                    self.didLongPress.toggle()
                }
        )
        .simultaneousGesture(
            RotationGesture()
                .onChanged { value in
                    self.rotation = value
                }
        )
        .simultaneousGesture(
            MagnificationGesture()
                .onChanged { value in
                    self.scale = value
                }
        )
    }
    
}
