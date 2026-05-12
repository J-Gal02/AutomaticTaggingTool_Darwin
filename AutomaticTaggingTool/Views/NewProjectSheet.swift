//
//  NewProjectSheet.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

struct NewProjectSheet: View {
    @State private var selectedDirectory: URL?
    @Environment(\.dismiss) private var dismiss
    @State private var projectName: String = ""
    var onCreate: (String, URL) -> Void
    @FocusState private var projectNameFieldIsFocused: Bool
    
    var body: some View {
        VStack{
            HStack {
                Text("Project Name: ")
                TextField("Default Project", text: $projectName)
                    .focused($projectNameFieldIsFocused)
                    .disableAutocorrection(true)
            }
            .padding()
            HStack {
                Text("Project Directory: ")
                Button(selectedDirectory?.path ?? "Choose Location") {
                    pickDirectory()
                }
            }
        }
        
        HStack(){
            Button("Cancel") {
                dismiss()
            }
            Button("Create") {
                if let directory = selectedDirectory {
                    onCreate(projectName, directory)
                    dismiss()
                }
            }
            .disabled(projectName.isEmpty || selectedDirectory == nil)
            .padding()
            
        }
    }
    
    private func pickDirectory() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.canCreateDirectories = true
        panel.prompt = "Choose"
        panel.begin { response in
            if response == .OK, let url = panel.url {
                selectedDirectory = url
            }
        }
    }
}



#Preview {
    NewProjectSheet(onCreate: {_, _ in})
}
