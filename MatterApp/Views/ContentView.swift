//
//  ContentView.swift
//  MatterApp
//
//  Created by Confate Muleya  on 15/12/2025.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("MatterLogo")
                    .resizable()
                    .frame(width: 300, height: 100)
                    .offset(x: 20)
                Spacer().frame(height: 40)
                NavigationLink(destination: HomeView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.Orange)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

















