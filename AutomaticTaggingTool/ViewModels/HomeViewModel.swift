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
    var currentProject: Project?
    
    
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
    
    func openProject() {
        
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.canCreateDirectories = false
        panel.prompt = "Select existing project"
        panel.begin { response in
            if response == .OK, let url = panel.url {
                self.projectDirectory = url
                Task {
                    do {
                        let project = try await ProjectLoader.load(from: url)
                        self.currentProject = project
                        print("Opened project \(project.name)")
                    } catch {
                        print("Failed to open project \(error)")
                    }
                }
            }
        }
            }
        
    
    }
    
    
