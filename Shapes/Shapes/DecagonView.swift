import SwiftUI

struct DecagonView: View {
    @State public var animateScale = false
    @State public var didLongPress: Bool = false
    @State public var drag: CGSize = .zero
    @State public var scale: CGFloat = 1
    @State var rotation: Angle = .zero
    @State var gradient = Gradient(colors: [.green, .blue])
    
    var body: some View {
        
        GeometryReader { geometry in
            PolygonShape(sides: 5)
                .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                .rotationEffect(.degrees(35))
            PolygonShape(sides: 5)
                .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
        }
        .padding(.vertical, 10)
        .shadow(radius: 10)
        .rotationEffect(rotation)
        .scaleEffect(scale)
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
                    self.gradient = self.didLongPress == false ? Gradient(colors: [.purple, .blue]) : Gradient(colors: [.green, .blue])
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
