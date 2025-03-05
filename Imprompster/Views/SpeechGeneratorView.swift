//
//  SpeechGeneratorView.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/3/25.
//

import SwiftUI

struct SpeechGeneratorView: View {
    

    @State private var isSpeechCardShowing: Bool = false
    @State private var speechType: String = "tp"
    
    
    @Binding var path: [String]
    
    
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
                
            
            VStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.pink)
                        .frame(height: 50)
                        .padding(.horizontal, 10)
                        .shadow(radius: 5, x: 5, y: 5)
                    
                    
                    Text("Speech Prompt Generator")
                        .foregroundStyle(.white)
                        .font(.system(size: 25, weight: .bold, design: .monospaced))
                        .shadow(radius: 5, x: 5, y: 5)
                }
                
                
                
                GeometryReader { proxy in
                    ScrollView(.vertical, showsIndicators: false){
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.white)
                                .frame(width: 360, height: 350)
                                .shadow(radius: 5, x: 5, y: 5)
                            
                            
                            VStack(spacing: 30) {
                                
                                Button {
                                    path.append("impromptuGenerator")
                                } label: {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(Color.teal)
                                            .frame(width: 300, height: 60)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Impromptu")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 18, weight: .bold))
                                    }
                                    .frame(height: 50)
                                }
                                
                                
                            
                                
                                
                                
                                Button {
                                    isSpeechCardShowing.toggle()
                                    speechType = "tp"
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(Color.teal)
                                            .frame(width: 300, height: 60)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Extemperaneous")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        
                                            
                                            
                                        
                                    }
                                    .frame(height: 50)
                                }
                                .sheet(isPresented: $isSpeechCardShowing) {
                                    DebateResolutionCardView(cardType: $speechType)
                                }
                                
                                
                                Button {
                                    isSpeechCardShowing.toggle()
                                    speechType = "ld"
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(Color.teal)
                                            .frame(width: 300, height: 60)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Apologetics")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        
                                            
                                            
                                        
                                    }
                                    .frame(height: 50)
                                    
                                }
                                .sheet(isPresented: $isSpeechCardShowing) {
                                    DebateResolutionCardView(cardType: $speechType)
                                }
                                
                                Button {
                                    isSpeechCardShowing.toggle()
                                    speechType = "ld"
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(Color.teal)
                                            .frame(width: 300, height: 60)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Mars Hill")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        
                                            
                                            
                                        
                                    }
                                    .frame(height: 50)
                                    
                                }
                                .sheet(isPresented: $isSpeechCardShowing) {
                                    DebateResolutionCardView(cardType: $speechType)
                                }
                            }
                            .frame(width: proxy.size.width,  height: proxy.size.height)
                            
                        }
                }
                }
                
            }
            
            
        }
        .navigationTransition(.automatic)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbarColorScheme(.dark)
    }
}


#Preview {
    SpeechGeneratorView(path: .constant([]))
}
