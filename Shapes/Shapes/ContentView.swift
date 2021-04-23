import SwiftUI

struct ContentView: View {
    @State private var animateScale = false
    @State private var didLongPress: Bool = false
    @State private var drag: CGSize = .zero
    @State private var scale: CGFloat = 1
    @State var rotation: Angle = .zero
    @State private var changeColor = Color.purple
    
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    let gradient = Gradient(colors: [.green, .blue])
    
    var body: some View {

            GeometryReader { geometry in
                VStack(){
                    VStack(){
                        Text("Isosceles trapezoid")
                            .font(.title)
                            .fontWeight(.semibold)
                        Path { path in
                            path.move(to: CGPoint(x: self.screenWidth/2-100, y: 0))
                            path.addLine(to: CGPoint(x: self.screenWidth/2+100, y: 0))
                            path.addLine(to: CGPoint(x: self.screenWidth/2+150, y: 150))
                            path.addLine(to: CGPoint(x: self.screenWidth/2-150, y: 150))
                        }.fill(Color.yellow)
                        .padding(.vertical, 10)
                        .shadow(radius: 10)
                    }
                    .padding(.vertical, 30)
                    
                    VStack(){
                        Text("Decagon")
                            .font(.title)
                            .fontWeight(.semibold)
                        GeometryReader { geometry in
                            PolygonShape(sides: 5)
                                .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                                .rotationEffect(.degrees(35))
                            PolygonShape(sides: 5)
                                .fill(LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading))
                        }
                        
                        .padding(.vertical, 10)
                        .shadow(radius: 10)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
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
                                    self.scale = self.didLongPress == false ? 2 : 1
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
                    .padding(.vertical, 30)
                    .animation(.default)
                }
            }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
