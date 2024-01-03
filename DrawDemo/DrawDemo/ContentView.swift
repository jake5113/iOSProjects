//
//  ContentView.swift
//  DrawDemo
//
//  Created by 이종원 on 12/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    /*Rectangle()
                     
                     Circle()
                     .fill(.red)
                     .frame(width: 200, height: 200)
                     
                     Capsule()
                     .stroke(lineWidth: 10)
                     .foregroundStyle(.blue)
                     .frame(width: 200, height: 100)
                     
                     RoundedRectangle(cornerRadius: CGFloat(20))
                     .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10)]))
                     .foregroundStyle(.blue)
                     .frame(width: 250, height: 150)
                     
                     Ellipse()
                     .stroke(style: StrokeStyle(lineWidth: 20,
                     dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                     .foregroundStyle(.blue)
                     .frame(width: 250, height: 150)*/
                    
                    GradientView()
                    
                    Path { path in
                        path.move(to: CGPoint(x: 10, y: 0))
                        path.addLine(to: CGPoint(x: 10, y: 350))
                        path.addLine(to: CGPoint(x: 300, y: 300))
                        path.closeSubpath()
                    }
                    .fill(.green)
                    
                    MyShape()
                        .fill(.red)
                        .frame(width: 360, height: 350)
                }
                
            }
            
        }.padding()
    }
}

struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct GradientView: View {
    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
    
    var body: some View {
        VStack {
            NavigationLink (destination: ExampleView()){
                Circle()
                    .fill(.blue.gradient)
                    .frame(width: 200, height: 200)
            }
            
            Circle()
                .fill(.blue.shadow(.drop(color: .black, radius: 10)))
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(.blue.shadow(.inner(color: .white, radius: 15)))
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(RadialGradient(gradient: colors,
                                     center: .center,
                                     startRadius: CGFloat(0),
                                     endRadius: CGFloat(300)))
            
            Circle()
                .fill(AngularGradient(gradient: colors, center: .center))
        }
    }
}

#Preview {
    ContentView()
}
