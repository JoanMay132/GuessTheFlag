//
//  StacksToArrangeViews.swift
//  GuesTheFlag
//
//  Created by Joan May on 20/09/24.
//

import SwiftUI

struct StacksToArrangeViews: View {
    var body: some View {
        
                NavigationStack {
                    Form {
        
                        Text("Hi")
                    }
                    .navigationTitle("Guess The Flags")
                }
        
                VStack(alignment: .leading){
                    Text("Hello, world!")
                    Text("Another text over the text")
                }
        
                HStack(alignment: .top){
                    Text("Hello, world!")
                    Text("Another text over the text")
                }
                ZStack(alignment: .top){
                    Text("Pan con ajo")
                    Text("Pan con ajo es god")
                }
                ZStack(){
                    Color(red: 1, green: 0.9, blue: 0.7)
                        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200 )
                    Text("Pan con ajo")
                        .background(.red)
                }
                .background(.yellow)
                .ignoresSafeArea()
        
                ZStack() {
                    VStack(spacing: 0){
                        Color.red
                        Color.blue
                    }
                    Text("Your content")
                        .foregroundStyle(.secondary)
                        .padding(30)
                        .background(.ultraThinMaterial)
                }
                Spacer()
                Spacer()
        
            }
    }


#Preview {
    StacksToArrangeViews()
}
