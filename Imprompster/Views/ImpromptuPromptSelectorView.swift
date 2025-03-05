//
//  ImpromptuPromptSelectorView.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/5/25.
//

import SwiftUI

struct ImpromptuPromptSelectorView: View {
    
    @State private var isSpeechCardShowing: Bool = false

    @State private var impromptuSpeechType: String = ""


    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.indigo)
                                .frame(height: 100)
                                .padding(.horizontal, 20)
                                .shadow(radius: 5, x: 5, y: 5)
                            
                            
                            Text("Impromptu Generator")
                                .foregroundStyle(.white)
                                .font(.system(size: 27.5, weight: .bold, design: .monospaced))
                                .shadow(radius: 5, x: 5, y: 5)
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 20) {
                            Button {
                                impromptuSpeechType = "parliAny"
                                isSpeechCardShowing.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.pink)
                                        .frame(height: 50)
                                        .padding(.horizontal, 20)
                                        .shadow(radius: 5, x: 5, y: 5)
                                    
                                    
                                    Text("Any Topic")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                                        .shadow(radius: 5, x: 5, y: 5)
                                }
                            }
                            .sheet(isPresented: $isSpeechCardShowing) {
                                DebateResolutionCardView(cardType: $impromptuSpeechType)
                            }
                            
                            Button {
                                impromptuSpeechType = "parliPolicy"
                                isSpeechCardShowing.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [ .red, .yellow, .green, .blue, .purple]), startPoint: .leading, endPoint: .trailing))
                                        .frame(height: 50)
                                        .padding(.horizontal, 20)
                                        .shadow(radius: 5, x: 5, y: 5)
                                    
                                    
                                    Text("Colors")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                                        .shadow(radius: 5, x: 5, y: 5)
                                }
                            }
                            .sheet(isPresented: $isSpeechCardShowing) {
                                DebateResolutionCardView(cardType: $impromptuSpeechType)
                            }
                            
                            Button {
                                impromptuSpeechType = "parliValue"
                                isSpeechCardShowing.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.pink)
                                        .frame(height: 50)
                                        .padding(.horizontal, 20)
                                        .shadow(radius: 5, x: 5, y: 5)
                                    
                                    
                                    Text("Quotes")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                                        .shadow(radius: 5, x: 5, y: 5)
                                }
                            }
                            .sheet(isPresented: $isSpeechCardShowing) {
                                DebateResolutionCardView(cardType: $impromptuSpeechType)
                            }
                            
                            Button {
                                impromptuSpeechType = "parliFact"
                                isSpeechCardShowing.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.pink)
                                        .frame(height: 50)
                                        .padding(.horizontal, 20)
                                        .shadow(radius: 5, x: 5, y: 5)
                                    
                                    
                                    Text("Objects")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                                        .shadow(radius: 5, x: 5, y: 5)
                                }
                            }
                            .sheet(isPresented: $isSpeechCardShowing) {
                                DebateResolutionCardView(cardType: $impromptuSpeechType)
                            }
                            
                            Button {
                                impromptuSpeechType = "parliScenario"
                                isSpeechCardShowing.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.pink)
                                        .frame(height: 50)
                                        .padding(.horizontal, 20)
                                        .shadow(radius: 5, x: 5, y: 5)
                                    
                                    
                                    Text("Events")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                                        .shadow(radius: 5, x: 5, y: 5)
                                }
                            }
                            .sheet(isPresented: $isSpeechCardShowing) {
                                DebateResolutionCardView(cardType: $impromptuSpeechType)
                            }
                            
                            
                        }
                        
                        
                        Spacer()
                    }
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbarColorScheme(.dark)
}
}

#Preview {
    ImpromptuPromptSelectorView()
}
