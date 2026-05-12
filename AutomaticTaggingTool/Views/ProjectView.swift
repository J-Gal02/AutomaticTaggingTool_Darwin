//
//  ProjectView.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

struct ProjectView: View {
    var project: Project
    @State private var selectedTool: ProjectTool? = .audio
    
    var body: some View {
        NavigationSplitView {
            // sidebar
            List(selection: $selectedTool) {
                Label("Audio", systemImage: "waveform")
                    .tag(ProjectTool.audio)
            }
        } detail: {
            // main area
            switch selectedTool {
            case .audio:
                AudioToolView(project: project)
            case .vocalIsolation:
                Text("Vocal Isolation coming soon")
            case .transcribe:
                Text("Transcribe coming soon")
                
            case .none:
                Text("Select a tool")
            }
        }
    }
}

#Preview {
    
}
