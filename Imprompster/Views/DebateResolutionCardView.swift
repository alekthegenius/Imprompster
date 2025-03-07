//
//  DebateResolutionCardView.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/3/25.
//

import SwiftUI


struct DebateResolutionCardView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel: ViewModel = ViewModel()
    
    @Binding var cardType: String
    
    @State private var generatedResolution: String = ""
    
    @State private var cardTitle: String = ""
    
    @State private var cardBGColor: Color = .teal
    
    
    var body: some View {
        ZStack {
            cardBGColor
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
                    Text(generatedResolution)
                        .foregroundStyle(.white)
                        .font(.system(size: 21, weight: .regular, design: .monospaced))
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
                            .foregroundStyle(cardBGColor)
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
        switch cardType {
        case "tp":
            generatedResolution = viewModel.randomTpRes()
            cardTitle = "Team Policy Resolution"
        case "parliAny":
            generatedResolution = viewModel.randomParliAllRes()
            cardTitle = "All Types, Parliamentary Resolution"
        case "parliPolicy":
            generatedResolution = viewModel.randomParliPolicyRes()
            cardTitle = "Policy, Parliamentary Resolution"
        case "parliValue":
            generatedResolution = viewModel.randomParliValueRes()
            cardTitle = "Value, Parliamentary Resolution"
        case "parliScenario":
            generatedResolution = viewModel.randomParliScenarioRes()
            cardTitle = "Scenario, Parliamentary Resolution"
        case "parliFact":
            generatedResolution = viewModel.randomParliFactRes()
            cardTitle = "Fact, Parliamentary Resolution"
        case "ld":
            generatedResolution = viewModel.randomLdRes()
            cardTitle = "Lincoln Douglas Resolution"
        default:
            generatedResolution = viewModel.randomTpRes()
            cardTitle = "Team Policy Resolution"
        }
    }
}

#Preview {
    DebateResolutionCardView(cardType: .constant("tp"))
}
