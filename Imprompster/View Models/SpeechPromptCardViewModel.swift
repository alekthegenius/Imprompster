//
//  SpeechPromptCardViewModel.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/5/25.
//

import Foundation
import SwiftUI

extension SpeechPromptCardView {
    @Observable
    class ViewModel {
        
        
        var impromptuColors: [String] = []
        var impromptuEvents: [String] = []
        var impromptuObjects: [String] = []
        var impromptuQuotes: [String] = []
        
        var apologeticsPrompts: [String] = []
        
        var extempPrompts: [String] = []
        
        var marsHillPrompts: [String] = []
        
        
        var lastStoredPrompt: String = ""
        
        init() {
            print("Setting Up Resolutions")
            do {
                let impromptuColorsPath = Bundle.main.path(forResource: "colornames", ofType: "csv") ?? ""
                let impromptuEventsPath = Bundle.main.path(forResource: "events", ofType: "csv") ?? ""
                let impromptuObjectsPath = Bundle.main.path(forResource: "objects", ofType: "csv") ?? ""
                let impromptuQuotesPath = Bundle.main.path(forResource: "quotes", ofType: "csv") ?? ""
                
                let apologeticsPath = Bundle.main.path(forResource: "apologeticsPrompts", ofType: "csv") ?? ""
                
                let extempPath = Bundle.main.path(forResource: "extempPrompts", ofType: "csv") ?? ""
                
                let marsHillPath = Bundle.main.path(forResource: "marsHillPrompts", ofType: "csv") ?? ""
                    
                    
                    
                impromptuColors = try String(contentsOfFile: impromptuColorsPath, encoding: .utf8).components(separatedBy: .newlines)
                impromptuEvents = try String(contentsOfFile: impromptuEventsPath, encoding: .utf8).components(separatedBy: .newlines)
                impromptuObjects = try String(contentsOfFile: impromptuObjectsPath, encoding: .utf8).components(separatedBy: .newlines)
                impromptuQuotes = try String(contentsOfFile: impromptuQuotesPath, encoding: .utf8).components(separatedBy: .newlines)
                
                apologeticsPrompts = try String(contentsOfFile: apologeticsPath, encoding: .utf8).components(separatedBy: .newlines)
                
                extempPrompts = try String(contentsOfFile: extempPath, encoding: .utf8).components(separatedBy: .newlines)
                
                marsHillPrompts = try String(contentsOfFile: marsHillPath, encoding: .utf8).components(separatedBy: .newlines)
                
            } catch {
                print(error)
                return
            }
        }

            
            

        
        func randomColor() -> (name: String, color: Color) {
            
            guard !impromptuColors.isEmpty else {
                return ("No Color Found", .white)
            }
            
            var selectedColor: [String]
            
            repeat {
                selectedColor = impromptuColors.randomElement()?.components(separatedBy: ",") ?? []
            } while selectedColor.isEmpty || selectedColor[0] == lastStoredPrompt || selectedColor[0] == ""
            
            
            
            guard !selectedColor[0].isEmpty && !selectedColor[1].isEmpty else {
                return ("No Color Found", .white)
            }
            
            guard type(of: selectedColor) == [String].self else {
                return ("No Color Found", .white)
            }
            
            let cleanedHex = selectedColor[1].trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            
            let hexValue = Int(cleanedHex, radix: 16)!
            
            let colorValue = Color(hex: hexValue)
            
            lastStoredPrompt = selectedColor[0]
            
            
            return (selectedColor[0], colorValue)
        }
        
        
        func randomImpromptuEvent() -> String {
            guard !impromptuEvents.isEmpty else {
                return "No Impromptu Events Available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = impromptuEvents.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomImpromptuObject() -> String {
            guard !impromptuObjects.isEmpty else {
                return "No Impromptu Objects Available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = impromptuObjects.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomImpromptuQuote() -> (String, String) {
            guard !impromptuQuotes.isEmpty else {
                return ("No Impromptu Quote Prompts Available", "")
            }
            
            var newPrompt: String
            var finalPrompt: [String]
            var cleanedFinalPrompt: (String, String)
            
            
            repeat {
                newPrompt = impromptuQuotes.randomElement() ?? ""
                
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            finalPrompt = newPrompt.components(separatedBy: "::")
            cleanedFinalPrompt = (finalPrompt[0], "- \(finalPrompt[1])")
            
            
            guard finalPrompt.count == 2 else {
                return ("No Impromptu Quote Prompts Available", "")
            }
            
            
            lastStoredPrompt = newPrompt
            return cleanedFinalPrompt
        }
        
        func randomApologeticsPrompt() -> String {
            guard !apologeticsPrompts.isEmpty else {
                return "No Apologetic Prompts Available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = apologeticsPrompts.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt || newPrompt == "---"
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomExtempPrompt() -> String {
            guard !extempPrompts.isEmpty else {
                return "No Extemperaeous Prompts Available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = extempPrompts.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomMarsHillPrompt() -> String {
            guard !marsHillPrompts.isEmpty else {
                return "No Mars Hill Prompts Available"
            }
            
            var newPrompt: String
            
            
            
            repeat {
                newPrompt = marsHillPrompts.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        
        func isColorWhite(_ color: Color) -> Bool {
            let uiColor = UIColor(color)
            guard let components = uiColor.cgColor.components, components.count >= 3 else {
                return false
            }
            
            let red = components[0]
            let green = components[1]
            let blue = components[2]
            
            if red >= 0.6 && green >= 0.6 && blue >= 0.6 {
                return true
            } else if red >= 0.9 && green >= 0.9 && blue >= 0 {
                return true
            } else {
                return false
            }
            

        }
        
        
        
    }
    
}




