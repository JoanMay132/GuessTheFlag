//
//  StackingUpButtons.swift
//  GuesTheFlag
//
//  Created by Joan May on 21/09/24.
//

import SwiftUI

struct StackingUpButtons: View {
    @State private var countries = ["Estonia", "France", "Germany","Ireland", "Italy","Monaco", "Nigeria", "Poland","Russia","Spain","UK", "US"].map { $0.lowercased()}.shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitlte = ""
    @State private var score = 0
    var body: some View {
        ZStack {
//            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: Color(red: 0.7,green: 0.2, blue: 0.3), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer].capitalized)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button{
                            // Flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
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
        .alert(scoreTitlte, isPresented: $showingScore){
//            Button("Continue", action: askQuestion)
            Button(gameOver ? "Restart" : "Continue", action: gameOver ? resetGame : askQuestion)
        } message: {
            Text("Your score is: \(score)")
        }
        
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitlte = "Correct"
            score += 1
        }else {
            scoreTitlte = "Wrong"
        }
        
        if score == 2 {
            scoreTitlte = "Game Over"
            gameOver = true
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        score = 0
        gameOver = false
        askQuestion()
    }
}

#Preview {
    StackingUpButtons()
}
