//
//  Line2View.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/22.
//

import SwiftUI

struct Line2View: View {
    @State private var coordinate: CGFloat = 0

        var body: some View {
            VStack {
                Text("TEST")
                    .overlay(Line1(coordinate: coordinate)
                                .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                .frame(width: 2, height: 2)
                                .background(Color.blue)
                                //.stroke(Color.red)
                                //.offset(x: -36, y: -170)
                                .animation(Animation.linear(duration: 1)))
                
                
                    .onAppear { self.coordinate = 100 }
            }
        }
}

struct Line2View_Previews: PreviewProvider {
    static var previews: some View {
        Line2View()
            .previewLayout(.sizeThatFits)
    }
}


struct Line1: Shape {
    var coordinate: CGFloat
    
    var animatableData: CGFloat {
            get { coordinate }
            set { coordinate = newValue }
        }

    func path(in rect: CGRect) -> Path {
        Path { path in
            //path.move(to: .zero)
            path.move(to: CGPoint(x: 0, y: 0))
            //path.addLine(to: CGPoint(x: coordinate, y: coordinate))
            path.addLine(to: CGPoint(x: coordinate, y: 0))
        }
        
    }
}
