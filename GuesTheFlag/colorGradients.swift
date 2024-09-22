//
//  ContentView.swift
//  GuesTheFlag
//
//  Created by Joan May on 19/09/24.
//

import SwiftUI

struct colorGradients: View {
    var body: some View {
        //        Spacer()

        
        // Linear Gradient 1
        LinearGradient(colors: [.white,.black], startPoint: .top, endPoint: .bottom)
        
        
        // Linear gradient
        LinearGradient(stops: [
            Gradient.Stop(color: .white, location: 0.45),
            Gradient.Stop(color: .black, location: 0.55),
            
        
        ], startPoint: .bottom, endPoint: .top)
        
        // Radial Gradient
        RadialGradient(colors: [.white, .yellow,.purple], center: .center, startRadius: 20, endRadius: 100)
        
        // Angular Gradient
        AngularGradient(colors: [.yellow,.purple,.blue,.red,.brown,.yellow], center: .center)
        
        // A simple use of background gradient
        Text("Hello world")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.blue.gradient)
        
    }
}


#Preview {
    colorGradients()
}
