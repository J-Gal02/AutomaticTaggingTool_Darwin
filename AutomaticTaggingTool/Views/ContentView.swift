//
//  ContentView.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI
import UniformTypeIdentifiers


struct ContentView: View {
    @State private var showingFilePicker = false
    @State private var mediaURL: URL?
    @State private var viewModel = ProjectViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Let's get extracting")
            Button("Open File", systemImage: "arrow.up") {
                showingFilePicker = true
                
            }
            
        }
        .padding()
        .fileImporter(
            isPresented: $showingFilePicker,
            allowedContentTypes: [.movie, .video]
        ) {
            viewModel.handleFileSelection($0)
        }
    }
    
}

#Preview {
    ContentView()
}
