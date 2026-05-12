//
//  HomeViewModel.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

@Observable

class HomeViewModel {
    var showingNewProject = false
    var projectName = ""
    var projectDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appending(path: "ATT")
    
    
    func createNewProject() {
        Task {
            do {
                let project = try await ProjectCreator.create(name: projectName, in: projectDirectory)
                print("Created project \(project.name)")
            } catch {
                print("Failed to create project \(error)")
            }
        }
    }
}
