import SwiftUI

struct ContentView: View {
    
    var body: some View {

            GeometryReader { geometry in
                VStack(){
                    VStack(){
                        Text("Isosceles trapezoid")
                            .font(.title)
                            .fontWeight(.semibold)
                        TrapezoidView()
                    }
                    .padding(.vertical, 30)
                    
                    VStack(){
                        Text("Decagon")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        DecagonView()

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
