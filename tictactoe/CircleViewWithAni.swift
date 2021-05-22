//
//  CircleViewWithAni.swift
//  tictactoe
//
//  Created by Terry Kuo on 2021/5/22.
//

import SwiftUI

struct CircleViewWithAni: View {
    
    @State var toggle = false
    
    var body: some View {
        ZStack {
            if toggle {
                CircleView(xorO: .circle)
            } else {
                CircleView()
                    
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                toggle.toggle()
            }
            
            print("tapped")
        }
        
        
    }
}

struct CircleViewWithAni_Previews: PreviewProvider {
    static var previews: some View {
        CircleViewWithAni().previewLayout(.sizeThatFits)
    }
}
