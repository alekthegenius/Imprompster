//
//  HomeView.swift
//  Imprompster
//
//  Created by Alek Vasek on 2/28/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            
            Color.pink
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Imprompster")
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .padding(.top, 50)
                    
                
                Spacer()
                
                
                Button { // Debate Resolution Generator
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(Color.white)
                            .frame(width: 300, height: 60)
                            .shadow(radius: 5, x: 5, y: 5)
                        
                        Text("Debate Resolution Generator")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                            
                            
                        
                    }
                }
                .frame(height: 50)
                .padding(.bottom, 15)
                
                
                Button { // Speech Generator
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(Color.white)
                            .frame(width: 300, height: 60)
                            .shadow(radius: 5, x: 5, y: 5)
                        
                        Text("Debate Resolution Generator")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                            
                            
                        
                    }
                }
                .frame(height: 50)
                .padding(.top, 15)
                
                Spacer()
            }
        }
    }
    
}

#Preview {
    HomeView()
}
