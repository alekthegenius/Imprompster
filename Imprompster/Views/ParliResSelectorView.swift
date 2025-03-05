//
//  ParliResSelectorView.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/3/25.
//

import SwiftUI

struct ParliResSelectorView: View {
        
        @State private var isResCardShowing: Bool = false
    
        @State private var parliResType: String = ""
    
    
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
                                
                                
                                Text("Parlimentary Resolutions")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 27.5, weight: .bold, design: .monospaced))
                                    .shadow(radius: 5, x: 5, y: 5)
                            }
                            
                            Spacer()
                            
                            VStack(spacing: 20) {
                                Button {
                                    parliResType = "parliAny"
                                    isResCardShowing.toggle()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundStyle(.pink)
                                            .frame(height: 50)
                                            .padding(.horizontal, 20)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("All Types")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                                            .shadow(radius: 5, x: 5, y: 5)
                                    }
                                }
                                .sheet(isPresented: $isResCardShowing) {
                                    DebateResolutionCardView(cardType: $parliResType)
                                }
                                
                                Button {
                                    parliResType = "parliPolicy"
                                    isResCardShowing.toggle()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundStyle(.pink)
                                            .frame(height: 50)
                                            .padding(.horizontal, 20)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Policy Resolution")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                                            .shadow(radius: 5, x: 5, y: 5)
                                    }
                                }
                                .sheet(isPresented: $isResCardShowing) {
                                    DebateResolutionCardView(cardType: $parliResType)
                                }
                                
                                Button {
                                    parliResType = "parliValue"
                                    isResCardShowing.toggle()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundStyle(.pink)
                                            .frame(height: 50)
                                            .padding(.horizontal, 20)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Value Resolution")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                                            .shadow(radius: 5, x: 5, y: 5)
                                    }
                                }
                                .sheet(isPresented: $isResCardShowing) {
                                    DebateResolutionCardView(cardType: $parliResType)
                                }
                                
                                Button {
                                    parliResType = "parliFact"
                                    isResCardShowing.toggle()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundStyle(.pink)
                                            .frame(height: 50)
                                            .padding(.horizontal, 20)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Fact Resolution")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                                            .shadow(radius: 5, x: 5, y: 5)
                                    }
                                }
                                .sheet(isPresented: $isResCardShowing) {
                                    DebateResolutionCardView(cardType: $parliResType)
                                }
                                
                                Button {
                                    parliResType = "parliScenario"
                                    isResCardShowing.toggle()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundStyle(.pink)
                                            .frame(height: 50)
                                            .padding(.horizontal, 20)
                                            .shadow(radius: 5, x: 5, y: 5)
                                        
                                        
                                        Text("Scenario Resolution")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                                            .shadow(radius: 5, x: 5, y: 5)
                                    }
                                }
                                .sheet(isPresented: $isResCardShowing) {
                                    DebateResolutionCardView(cardType: $parliResType)
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
    ParliResSelectorView()
}
