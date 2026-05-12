//
//  HomeView.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var showingNewProject = false
    
    var body: some View {
        VStack {
            Text("Home View")
            Button("Open Project") {
                
            }
            Button("New Project") {
                showingNewProject = true
            }
        }
        .sheet(isPresented: $showingNewProject) {
            NewProjectSheet(onCreate: { name, directory in
                viewModel.projectName = name
                viewModel.projectDirectory = directory
                viewModel.createNewProject()
            })
        }
    }
}

#Preview {
    HomeView()
}
