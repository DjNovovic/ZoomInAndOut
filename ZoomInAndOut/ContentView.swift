//
//  ContentView.swift
//  ZoomInAndOut
//
//  Created by Đorđije Novović on 28.8.21..
//

import SwiftUI

struct ContentView: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.largeTitle)
            .padding(16)
            .foregroundColor(.orange)
            .background(Color.secondary.cornerRadius(16))
            .scaleEffect(1 + currentAmount + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
