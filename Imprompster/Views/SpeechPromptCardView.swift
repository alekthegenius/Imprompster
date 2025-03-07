//
//  SpeechPromptCardView.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/5/25.
//

import SwiftUI

struct SpeechPromptCardView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel: ViewModel = ViewModel()
    
    @Binding var promptType: String
    
    @State private var generatedPrompt: String = ""
    
    @State private var cardTitle: String = ""
    
    @State private var cardBGColor: Color = .teal
    
    @State private var cardTextColor: Color = .white
    
    @State private var cardSubtitle: String = ""
    
    
    var body: some View {
        ZStack {
            cardBGColor
                .ignoresSafeArea()
            
            VStack {
                Text(cardTitle)
                    .foregroundStyle(cardTextColor)
                    .font(.system(size: 27.5, weight: .bold, design: .monospaced))
                    .shadow(radius: 5, x: 5, y: 5)
                    .padding(.top, 15)
                    .padding(.horizontal, 15)
                    .multilineTextAlignment(.center)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    Text(generatedPrompt)
                        .foregroundStyle(cardTextColor)
                        .font(.system(size: 21, weight: .regular, design: .monospaced))

                    
                    if !cardSubtitle.isEmpty {
                        Text(cardSubtitle)
                            .foregroundStyle(cardTextColor)
                            .font(.system(size: 21, weight: .bold, design: .monospaced))
                            .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 10)
                
                Button{
                    reSelectResolution()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .stroke(.white, lineWidth: 2)
                            .frame(width: 220, height: 47.5)
                        
                        Text("Regenerate")
                            .foregroundStyle(viewModel.isColorWhite(cardBGColor) ? .black : cardBGColor)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                    }
                }
                .padding(.top, 5)
                

                
                Button{
                    dismiss()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.clear)
                            .stroke(cardTextColor, lineWidth: 2)
                            .frame(width: 160, height: 47.5)
                        
                        Text("Dismiss")
                            .foregroundStyle(cardTextColor)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                    }
                }
                .padding(.vertical, 10)
                
            }
            
        }
        .onAppear() {
            print(cardTitle)
            reSelectResolution()
            
        }
        
        
    }
    
    func reSelectResolution() {
        switch promptType {
        case "impromptuAll":
            cardTextColor = .white
            cardBGColor = .teal
            
            
            let impromptuTypes: [String] = ["color", "quote", "object", "event"]
            
            let randomType: String = impromptuTypes.randomElement() ?? "color"
            
            switch randomType {
                case "color":
                    let randomColor = viewModel.randomColor()
                    generatedPrompt = randomColor.name
                    
                    cardBGColor = randomColor.color
                    cardTitle = "Colors, Impromptu"
                    
                    if viewModel.isColorWhite(randomColor.color) {
                        cardTextColor = .black
                    } else {
                        cardTextColor = .white
                    }
                    cardSubtitle = ""
                case "quote":
                    guard !viewModel.randomImpromptuQuote().1.isEmpty else {
                            generatedPrompt = "Error Getting Quotes"
                            return
                    }
                    generatedPrompt = viewModel.randomImpromptuQuote().0
                    cardSubtitle = viewModel.randomImpromptuQuote().1
                case "object":
                    generatedPrompt = viewModel.randomImpromptuObject()
                    cardSubtitle = ""
                case "event":
                    generatedPrompt = viewModel.randomImpromptuEvent()
                    cardSubtitle = ""
                default:
                    generatedPrompt = "Uknown Request"
                    cardTitle = "Error"
            }
            
            cardTitle = "Any Topic, Impromptu"
        case "impromptuColor":
            let randomColor = viewModel.randomColor()
            generatedPrompt = randomColor.name
            
            cardBGColor = randomColor.color
            cardTitle = "Colors, Impromptu"
            
            if viewModel.isColorWhite(randomColor.color) {
                cardTextColor = .black
            } else {
                cardTextColor = .white
            }
            cardSubtitle = ""
        case "impromptuQuote":
            cardTextColor = .white
            cardBGColor = .teal
            
            guard !viewModel.randomImpromptuQuote().1.isEmpty else {
                    generatedPrompt = "Error Getting Quotes"
                    return
            }
            
            generatedPrompt = viewModel.randomImpromptuQuote().0
            cardSubtitle = viewModel.randomImpromptuQuote().1
            
            cardTitle = "Quotes, Impromptu"
        case "impromptuObject":
            cardTextColor = .white
            cardBGColor = .teal
            
            generatedPrompt = viewModel.randomImpromptuObject()

            cardTitle = "Objects, Impromptu"
            cardSubtitle = ""
        case "impromptuEvent":
            cardTextColor = .white
            cardBGColor = .teal
            
            generatedPrompt = viewModel.randomImpromptuEvent()

            cardTitle = "Events, Impromptu"
            cardSubtitle = ""
        case "apologetics":
            cardTextColor = .white
            cardBGColor = .red
            
            generatedPrompt = viewModel.randomApologeticsPrompt()

            cardTitle = "Apologetics"
            cardSubtitle = ""
        case "extemperaneous":
            cardTextColor = .white
            cardBGColor = .blue
            
            generatedPrompt = viewModel.randomExtempPrompt()

            cardTitle = "Extemperaneous"
            cardSubtitle = ""
        case "marsHill":
            cardTextColor = .white
            cardBGColor = .orange
            
            generatedPrompt = viewModel.randomMarsHillPrompt()
            
            cardTitle = "Mars Hill"
            cardSubtitle = ""
        default:
            generatedPrompt = "Uknown Request"
            cardTitle = "Error"
            cardSubtitle = ""
        }
    }
}

#Preview {
    SpeechPromptCardView(promptType: .constant("tp"))
}
