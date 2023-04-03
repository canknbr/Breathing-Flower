//
//  PetalView.swift
//  Breathing Flower
//
//  Created by Can Kanbur on 3.04.2023.
//

import SwiftUI

struct PetalView: View {
    @Binding var petal : Bool
    var degrees : Double = 0.0
    var body: some View {
        Image("petal").resizable().frame(width: 75, height: 75)
            .rotationEffect(.degrees(petal ? degrees : degrees),anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

struct PetalView_Previews: PreviewProvider {
    static var previews: some View {
        PetalView(petal: .constant(true))
    }
}
