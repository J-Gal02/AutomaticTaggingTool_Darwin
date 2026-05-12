//
//  ProjectViewModel.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//
import SwiftUI
import UniformTypeIdentifiers


@Observable
class ProjectViewModel {
    var videoURL: URL?
    var audioURL: URL?
    var isProcessing = false
    var projectDir: URL?
    var currentProject: Project?
    
    init(project: Project) {
        self.currentProject = project
    }
    
    func handleFileSelection(_ result: Result<URL, Error>) {
        switch result {
        case .success(let url):
            videoURL = url
            Task {await extractAudio(from: url) }
        case .failure(let error):
            print(error)
        }
    }
    
    private func extractAudio(from url: URL) async {
        isProcessing = true
        do {
            audioURL = try await AudioExtractor.extract(from: url)
        } catch {
            print(error)
        }
        isProcessing = false
    }
    
    func importMedia() {
        let panel = NSOpenPanel()
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.canCreateDirectories = false
        panel.prompt = "Import"
        panel.allowedContentTypes = [
            .movie,
            .video,
            .audio,
            .mp3,
            .wav
        ]
        panel.begin { response in
            if response == .OK, let url = panel.url {
                guard let project = self.currentProject else { return }
                do {
                    try MediaImporter.import(file: url, into: project)
                } catch {
                    print("Import failed \(error)")
                }
            }
        }
    }
    
    
}
