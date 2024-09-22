//
//  Buttons&Images.swift
//  GuesTheFlag
//
//  Created by Joan May on 20/09/24.
//

import SwiftUI

struct Buttons_Images: View {
    var body: some View {
        //        Button("Delete Section",role: .destructive, action: executeDelete)
        
        
        Image(systemName: "pencil.circle")
        
            .foregroundColor(.red)
        
        Button {} label: {
            Image(systemName: "pencil.circle")
        }
        
        Button("Edit", systemImage: "pencil") {
            print("Button was tapped")
        }
        
        Button {
            print("Button was tapped")
        } label: {
            Label("Edit",systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red.gradient)
            
            
        }
        VStack {
            Button("Button 1"){}
                .buttonStyle(.bordered)
            
            Button("Button 2",role: .destructive){}
                .buttonStyle(.bordered)
            
            Button("Button 3"){}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            
            Button("Button 4",role: .destructive){}
                .buttonStyle(.borderedProminent)
            
            Button {} label: {
                Text("Tap me!")
                    
                    .padding()
                    .background(.red)
                    .foregroundColor(.white)
            }
            
            
            
            }
        }
    }
    
    func executeDelete(){
        print("Now deleting...")

    }


#Preview {
    Buttons_Images()
}
