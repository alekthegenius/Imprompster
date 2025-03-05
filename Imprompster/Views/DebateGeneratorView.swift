//
//  DebateGeneratorView.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/3/25.
//

import SwiftUI

struct DebateGeneratorView: View {
    

    @State private var isResCardShowing: Bool = false
    @State private var resType: String = "tp"
    
    
    @Binding var path: [String]
    
    
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
                
            
            VStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.pink)
                        .frame(height: 100)
                        .padding(.horizontal, 20)
                        .shadow(radius: 5, x: 5, y: 5)
                    
                    
                    Text("Debate Resolution Generator")
                        .foregroundStyle(.white)
                        .font(.system(size: 27.5, weight: .bold, design: .monospaced))
                        .shadow(radius: 5, x: 5, y: 5)
                }
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 275)
                        .shadow(radius: 5, x: 5, y: 5)
                    
                    
                    VStack(spacing: 30) {
                        
                        Button {
                            path.append("parlimentaryGenerator")
                        } label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(Color.teal)
                                    .frame(width: 300, height: 60)
                                    .shadow(radius: 5, x: 5, y: 5)
                                
                                
                                Text("Parliamentary Resolutions")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .frame(height: 50)
                        }
                        
                        
                    
                        
                        
                        
                        Button {
                            isResCardShowing.toggle()
                            resType = "tp"
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(Color.teal)
                                    .frame(width: 300, height: 60)
                                    .shadow(radius: 5, x: 5, y: 5)
                                
                                
                                Text("Team Policy Resolutions")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .bold))
                                
                                
                                    
                                    
                                
                            }
                            .frame(height: 50)
                        }
                        .sheet(isPresented: $isResCardShowing) {
                            DebateResolutionCardView(cardType: $resType)
                        }
                        
                        
                        Button {
                            isResCardShowing.toggle()
                            resType = "ld"
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(Color.teal)
                                    .frame(width: 300, height: 60)
                                    .shadow(radius: 5, x: 5, y: 5)
                                
                                
                                Text("Lincoln Douglas Resolutions")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .bold))
                                
                                
                                    
                                    
                                
                            }
                            .frame(height: 50)
                        }
                        .sheet(isPresented: $isResCardShowing) {
                            DebateResolutionCardView(cardType: $resType)
                        }
                    }
                    
                }
                Spacer()
            }
            
            
        }
        .navigationTransition(.automatic)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbarColorScheme(.dark)
    }
}



#Preview {
    DebateGeneratorView(path: .constant([]))
}
