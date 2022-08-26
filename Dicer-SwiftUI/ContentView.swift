//
//  ContentView.swift
//  Dicer-SwiftUI
//
//  Created by Kaan Uslu on 26.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
     @State  var rightDiceNumber = 1
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button("Roll"){
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                }
                .background(Color.red)
                .font(.system(size: 50))
                .foregroundColor(.white)
                .padding()
                
                
            }
            
        }
        
    }
}


 
struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .frame(width: 150, height: 150)
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
