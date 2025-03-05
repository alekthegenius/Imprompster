//
//  SpeechPromptCardViewModel.swift
//  Imprompster
//
//  Created by Alek Vasek on 3/5/25.
//

import Foundation

extension SpeechPromptCardView {
    @Observable
    class ViewModel {
        
        
        var teamPolicyResolutions: [String] = []
        var lincolnDouglasResolutions: [String] = []
        var parliPolicyResolutions: [String] = []
        var parliValueResolutions: [String] = []
        var parliFactResolutions: [String] = []
        var parliScenarioResolutions: [String] = []
        var parliAllResolutions: [String] = []
        
        var lastStoredPrompt: String = ""
        
        init() {
            print("Setting Up Resolutions")
            do {
                let teamPolicyResolutionsPath = Bundle.main.path(forResource: "teamPolicyResolutions", ofType: "csv") ?? ""
                let parliResolutionsPath = Bundle.main.path(forResource: "parliResolutions", ofType: "csv") ?? ""
                let lincolnDouglasResolutionsPath = Bundle.main.path(forResource: "lincolnDouglasResolutions", ofType: "csv") ?? ""
                    
                    
                    
                teamPolicyResolutions = try String(contentsOfFile: teamPolicyResolutionsPath, encoding: .utf8).components(separatedBy: .newlines)
                
                lincolnDouglasResolutions = try String(contentsOfFile: lincolnDouglasResolutionsPath, encoding: .utf8).components(separatedBy: .newlines)
                
                parliPolicyResolutions = try String(contentsOfFile: parliResolutionsPath, encoding: .utf8).components(separatedBy: "---")[0].components(separatedBy: .newlines)
                parliValueResolutions = try String(contentsOfFile: parliResolutionsPath, encoding: .utf8).components(separatedBy: "---")[1].components(separatedBy: .newlines)
                parliFactResolutions = try String(contentsOfFile: parliResolutionsPath, encoding: .utf8).components(separatedBy: "---")[2].components(separatedBy: .newlines)
                parliScenarioResolutions = try String(contentsOfFile: parliResolutionsPath, encoding: .utf8).components(separatedBy: "---")[3].components(separatedBy: .newlines)
                
                teamPolicyResolutions.removeLast()
                
                lincolnDouglasResolutions.removeLast()
                
                parliPolicyResolutions.removeLast()
                parliValueResolutions.removeLast()
                parliFactResolutions.removeLast()
                parliScenarioResolutions.removeLast()
                
                parliAllResolutions = parliPolicyResolutions + parliValueResolutions + parliFactResolutions + parliScenarioResolutions
            
            } catch {
                print(error)
                return
            }
        }

            
            

        
        func randomParliValueRes() -> String {
            guard !parliValueResolutions.isEmpty else {
                return "No Parliamentary resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                    newPrompt = parliValueResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
            
            
        }
        
        func randomParliFactRes() -> String {
            
            guard !parliFactResolutions.isEmpty else {
                return "No Parliamentary resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = parliFactResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomParliPolicyRes() -> String {
            guard !parliPolicyResolutions.isEmpty else {
                return "No Parliamentary resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = parliPolicyResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomParliScenarioRes() -> String {
            guard !parliScenarioResolutions.isEmpty else {
                return "No Parliamentary resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = parliScenarioResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
            
        }
        
        func randomParliAllRes() -> String {
            
            guard !parliAllResolutions.isEmpty else {
                return "No Parliamentary resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = parliAllResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomLdRes() -> String {
            
            guard !lincolnDouglasResolutions.isEmpty else {
                return "No Lincoln Douglas resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = lincolnDouglasResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
        func randomTpRes() -> String {
            
            guard !teamPolicyResolutions.isEmpty else {
                return "No Team Policy resolutions available"
            }
            
            var newPrompt: String
            
            
            repeat {
                newPrompt = teamPolicyResolutions.randomElement() ?? ""
            } while newPrompt.isEmpty || newPrompt == lastStoredPrompt
            
            
            lastStoredPrompt = newPrompt
            return newPrompt
        }
        
    }
    
}
