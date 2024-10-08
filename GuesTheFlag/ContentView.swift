//
//  fariapp.swift
//  GuesTheFlag
//
//  Created by Joan May on 21/09/24.
//

import SwiftUI

// I replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.

struct FlagImage: View {
    var image: String
    var body: some View {
        Image(image)
            .clipShape(.capsule)
            .shadow(radius: 15)
    }
    
}

// Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.

struct Title: ViewModifier {
    var title: String
    func body(content: Content) -> some View {
        content
        Text(title)
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}
    
extension View {
    func titleStyle(with title: String) -> some View {
        modifier(Title(title: title))
    }
}
    


struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany","Ireland", "Italy","Monaco", "Nigeria", "Poland","Russia","Spain","UK", "US"].map { $0.lowercased()}.shuffled()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var gameOver = false
    @State private var score = 0
    @State private var currentAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
//            RadialGradient(stops: [
//                .init(color: .blue, location: 0.3),
//                .init(color: Color(red: 0.7, green: 0.2, blue: 0.3), location: 0.3)
//            ], center: .top, startRadius: 200, endRadius: 700)
            LinearGradient(stops: [.init(color: Color(red: 0.3, green: 0.2, blue: 0.5), location: 0.4)], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .titleStyle(with: "Guess The Flag")
                //Text("Guess The Flag ")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.bold())
                        Text(countries[currentAnswer].capitalized)
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                
                        ForEach(0..<3){ number in
                            Button{
                                // Flag was tapped
                                flagTapped(number)
                            }label: {
// replace the Image view used for flags with a new FlagImage()
                               // Image(countries[number])
                                FlagImage(image:countries[number])
//                                    .clipShape(.capsule)
//                                    .shadow(radius: 15)
                            }
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Your score is: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.weight(.semibold))
                Spacer()
                
            }
            .padding(20)
        }
        .alert(scoreTitle, isPresented: $showingScore){
            
            Button(gameOver ? "Restart" : "Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == currentAnswer {
            scoreTitle = "Correct"
            score += 1
        }else {
            scoreTitle = "Wrong! That's flag of \(countries[number])"
            gameOver = true
            score = 0
        }
      
        if score == 8 {
            scoreTitle = "You won!"
            gameOver = true
        }
        showingScore = true
        
    }
    
    
    func askQuestion(){
        
        if gameOver {
            score = 0
            gameOver = false
        }
        countries.shuffle()
        currentAnswer = Int.random(in: 0...2)
        
    }
}

#Preview {
    ContentView()
}
