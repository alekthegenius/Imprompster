//
//  HomeView.swift
//  Imprompster
//
//  Created by Alek Vasek on 2/28/25.
//

import SwiftUI


enum NavigationDestinations: String, CaseIterable, Hashable {
    case DebateGenerator
    case SpeechGenerator
    case ParliResolutionSelector
}

struct HomeView: View {
    
    let screens = NavigationDestinations.allCases
    @State private var path: [String] = []
    
    
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                
                
                Color.mint
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(Color.mint)
                            .frame(width: 300, height: 60)
                            .shadow(radius: 5, x: 5, y: 5)
                        Text("Imprompster")
                            .foregroundStyle(.white)
                            .font(.system(size: 32.5, weight: .bold, design: .monospaced))
                            .shadow(radius: 5, x: 7, y: 7)
                            
                    }
                    .padding(.top, 20)
                        
                    
                    Spacer()
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.white)
                            .frame(width: 360, height: 210)
                            .shadow(radius: 5, x: 5, y: 5)
                        
                            
                            
                            
                        
                        VStack(spacing: 40) {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(Color.pink)
                                    .frame(width: 300, height: 60)
                                    .shadow(radius: 5, x: 5, y: 5)
                                
                                
                                Button {
                                    path.append("debateGenerator")
                                } label: {
                                    
                                    Text("Debate Resolution Generator")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18, weight: .bold))
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                            .frame(height: 50)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(Color.pink)
                                    .frame(width: 300, height: 60)
                                    .shadow(radius: 5, x: 5, y: 5)
                                
                                
                                Button {
                                    path.append("speechGenerator")
                                } label: {
                                    
                                    Text("Speech Prompt Generator")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18, weight: .bold))
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                            .frame(height: 50)
                            

                        }
                        
                    }
                    .navigationDestination(for: String.self) { value in
                        if value == "debateGenerator" {
                            DebateGeneratorView(path: $path)
                        } else if value == "speechGenerator" {
                            SpeechGeneratorView(path: $path)
                        } else if value == "parlimentaryGenerator" {
                            ParliResSelectorView()
                        } else if value == "impromptuGenerator" {
                            ImpromptuPromptSelectorView()
                        } else {
                            DebateGeneratorView(path: $path)
                        }
                    }
                    
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 2)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack { // Footer
                            Text("Parli Resolutions Retrieved from AcePeak (Discontinued), Colors are From (meodai/color-names, Github), Quotes are From (Abirate/english-quotes, HuggingFace), Apologetics and Mars Hill Prompts taken from STOA USA")
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                        }
                    }
                    .frame(height: 14)
                    .padding(.horizontal, 12)
                    .padding(.top, 10)
                    
                    HStack { // Footer
                        Text("From TX With ❤️ © 2025 by Alek Vask")
                            .foregroundStyle(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                    }
                    .padding(.vertical, 5)
                    
                    
                }
            }
        }
        .toolbar(.hidden)
        
    }
    
}

#Preview {
    HomeView()
}
