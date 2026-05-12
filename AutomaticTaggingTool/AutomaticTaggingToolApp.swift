//
//  AutomaticTaggingToolApp.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

@main
struct AutomaticTaggingToolApp: App {
    @FocusedValue(\.projectViewModel) var projectViewModel
    
    var body: some Scene {
        WindowGroup("Home") {
            HomeView()
        }
        
        WindowGroup("Project", for: Project.self) { project in
            if let project = project.wrappedValue {
                ProjectView(project: project)
            }
        }
        .commands {
                    CommandGroup(replacing: .newItem) {
                        Button("Import Media...") {
                            projectViewModel?.importMedia()
                        }
                        .disabled(projectViewModel == nil)
                    }
                }
    }
}
