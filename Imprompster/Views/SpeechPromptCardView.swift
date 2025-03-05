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
    
    @State var generatedPrompt: String = ""
    
    @State var cardTitle: String = ""
    
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            VStack {
                Text(cardTitle)
                    .foregroundStyle(.white)
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
                        .foregroundStyle(.white)
                        .font(.system(size: 21, weight: .regular, design: .monospaced))
                        .shadow(radius: 5, x: 5, y: 5)
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
                        
                        Text("Generate Another")
                            .foregroundStyle(.teal)
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
                            .stroke(.white, lineWidth: 2)
                            .frame(width: 160, height: 47.5)
                        
                        Text("Dismiss")
                            .foregroundStyle(.white)
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
            generatedPrompt = viewModel.randomTpRes()
            cardTitle = "Any Topic, Impromptu"
        case "impromptuColor":
            generatedPrompt = viewModel.randomParliAllRes()
            cardTitle = "Colors, Impromptu"
        case "impromptuQuote":
            generatedPrompt = viewModel.randomParliPolicyRes()
            cardTitle = "Quotes, Impromptu"
        case "impromptuObject":
            generatedPrompt = viewModel.randomParliValueRes()
            cardTitle = "Objects, Impromptu"
        case "impromptuEvent":
            generatedPrompt = viewModel.randomParliScenarioRes()
            cardTitle = "Events, Impromptu"
        case "parliFact":
            generatedPrompt = viewModel.randomParliFactRes()
            cardTitle = "Fact, Parliamentary Resolution"
        case "ld":
            generatedPrompt = viewModel.randomLdRes()
            cardTitle = "Lincoln Douglas Resolution"
        default:
            generatedPrompt = viewModel.randomTpRes()
            cardTitle = "Team Policy Resolution"
        }
    }
}

#Preview {
    SpeechPromptCardView(promptType: .constant("tp"))
}
