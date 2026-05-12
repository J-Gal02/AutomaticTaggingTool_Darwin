//
//  AudioToolView.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

struct AudioToolView: View {
    var project: Project
    
    var body: some View {
        Text("Audio Tool")
        Text(project.name)
        Text(project.directory.path())
        
    }
}
