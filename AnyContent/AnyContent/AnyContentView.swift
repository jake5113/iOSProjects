//
//  AnyContentView.swift
//  AnyContent
//
//  Created by 이종원 on 12/19/23.
//

import SwiftUI

struct AnyContentView: View {
    @State private var rotation: Double = 0
    @State private var isSpinning: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundStyle(.blue)
                .frame(width: 360, height: 360)
            
            Image(systemName: "forward.fill")
                .font(.largeTitle)
                .offset(y: -180)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false),
                           value: rotation)
        }
        .onAppear() {
            self.isSpinning.toggle()
            rotation = isSpinning ? 0 : 360
        }
    }
}

struct Anime: View {
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    @State private var redCircle = false
    @State private var visibility = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.easeInOut(duration: 0.5))) {
                Text("Toggle Text Views")
            }
            .padding()
            
            if visibility {
                Text("Hello World")
                    .font(.largeTitle)
            }
            
            if !visibility {
                Text("Goodbye World")
                    .font(.largeTitle)
            }
            
            Circle()
                .fill(redCircle ? .red : .blue)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        redCircle.toggle()
                    }
                }
            
            Button {
                withAnimation(.linear (duration: 2)) {
                    self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
                }
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            } label: {
                Text("Click to animate")
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
            }
        }
    }
}

#Preview {
    AnyContentView()
}
