//
//  LineView.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/21.
//

import SwiftUI

struct LineView: View {
    
    var animatableData: CGFloat {
        get { num }
        set { self.num = newValue }
    }
    @State var num: CGFloat = 20
    @State var draw: Bool = false
    @State var scale = false
    @State var i = 0
    let p1 = CGPoint(x: 50, y: 50)
    let p2 = CGPoint(x: 100, y: 25)
    let p3 = CGPoint(x: 100, y: 100)
    
    let a1 = CGPoint(x: 250, y: 200)
    let a2 = CGPoint(x: 40, y: 200)
    
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: num, y: 200))
                path.addLine(to: CGPoint(x: 20, y: 200))
                
            }
            
            .strokedPath(StrokeStyle(lineWidth: 3, lineCap: .round))
            .foregroundColor(.black)
            //.scaleEffect(scale ? 2 : 1)
            //.offset(x: 130, y: 100)
            
            Lineshape(insetAmount: 39)
                .background(Color.black)
                .foregroundColor(.blue)
            
            Button(action: {
                DispatchQueue.main.async {
                    increment()
                }
                
                
            }, label: {
                Text("Button")
            })
        }
            
    }
    
    func increment() {
        withAnimation() {
            num += 100
        }
    }
    
    func increment2() {
        withAnimation(Animation.easeIn(duration: 5.5)) { self.draw.toggle() }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}

struct Lineshape: Shape {
    var insetAmount: CGFloat
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 150, y: 200))
        path.addLine(to: CGPoint(x: 20, y: 200))

        return path
   }
}
