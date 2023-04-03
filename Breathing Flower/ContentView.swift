//
//  ContentView.swift
//  Breathing Flower
//
//  Created by Can Kanbur on 3.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var petal = false
    @State var breatheInLabel = true
    @State var breatheOutLabel = false
    @State var offsetBreath = false
    @State var diffuseBreath = false
    @State var breathToBouquet = false

    var body: some View {
        ZStack {
            ZStack {
                Image("winterNight").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 900)
                SnowView()
                ZStack {
                    Group {
                        Text("Breath In").font(.title2).foregroundColor(.white)
                            .opacity(breatheInLabel ? 1 : 0)
                            .scaleEffect(breatheInLabel ? 0 : 1)
                            .offset(y: -160)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breatheInLabel)

                        Text("Breath Out").font(.headline).foregroundColor(.white)
                            .opacity(breatheOutLabel ? 0 : 1)
                            .scaleEffect(breatheOutLabel ? 0 : 1)
                            .offset(y: -160)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breatheOutLabel)
                    }

                    Group {
                        Image("smoke").resizable().frame(width: 35, height: 125).offset(y: offsetBreath ? 90 : 0)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: offsetBreath)
                            .blur(radius: diffuseBreath ? 1 : 60)
                            .offset(x: 0, y: diffuseBreath ? -50 : -100)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                    }.shadow(radius: diffuseBreath ? 20 : 0)

                    Group {
                        PetalView(petal: $petal, degrees: petal ? -25 : -5)
                        Image("petal").resizable().frame(width: 75, height: 125)
                        PetalView(petal: $petal, degrees: petal ? 25 : 5)
                        PetalView(petal: $petal, degrees: petal ? -50 : -10)
                        PetalView(petal: $petal, degrees: petal ? 50 : 10)
                    }
                    
                    Group{
                        Image("bouquet").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 400)
                            .rotationEffect(.degrees(37))
                            .offset(x:-25,y:90)
                            .scaleEffect(breathToBouquet ? 1.04: 1,anchor: .center)
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathToBouquet)
                        
                        
                        Image("bouquet").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 400)
                            .rotationEffect(.degrees(37))
                            .offset(x:-20,y:95)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .scaleEffect(breathToBouquet ? 1.02: 1,anchor: .center)
                            .hueRotation(Angle(degrees: breathToBouquet ? -50 : 300))
                            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathToBouquet)
                    }
                }
            }
        }.onAppear {
            breatheInLabel.toggle()
            breatheOutLabel.toggle()
            offsetBreath.toggle()
            diffuseBreath.toggle()
            petal.toggle()
            breathToBouquet.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
