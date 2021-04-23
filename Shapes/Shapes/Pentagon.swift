import SwiftUI

struct Pentagon{
    func path(Xcenter : CGFloat, Ycenter : CGFloat) -> Path {
        var path = Path()
        let numberOfSides : Int = 5
        let size : CGFloat = 100
        let step : CGFloat  = 2 * CGFloat.pi / CGFloat(numberOfSides)
        let shift : CGFloat = (CGFloat.pi / 180.0) * -18
        
        var curStep = CGFloat(0) * step + shift;
        path.move(to: CGPoint(
            x: Xcenter + size * cos(curStep),
            y: Ycenter + size * sin(curStep)
        ))
        
        curStep = CGFloat(1) * step + shift;
        path.addLine(to: CGPoint(
            x: Xcenter + size * cos(curStep),
            y: Ycenter + size * sin(curStep)
        ))
        
        curStep = CGFloat(2) * step + shift;
        path.addLine(to: CGPoint(
            x: Xcenter + size * cos(curStep),
            y: Ycenter + size * sin(curStep)
        ))
        
        curStep = CGFloat(3) * step + shift;
        path.addLine(to: CGPoint(
            x: Xcenter + size * cos(curStep),
            y: Ycenter + size * sin(curStep)
        ))
        
        curStep = CGFloat(4) * step + shift;
        path.addLine(to: CGPoint(
            x: Xcenter + size * cos(curStep),
            y: Ycenter + size * sin(curStep)
        ))
        
        return path
    }
}
