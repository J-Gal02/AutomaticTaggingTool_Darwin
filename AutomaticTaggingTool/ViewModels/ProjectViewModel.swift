//
//  ProjectViewModel.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//
import SwiftUI

@Observable
class ProjectViewModel {
    var videoURL: URL?
    var audioURL: URL?
    var isProcessing = false
    
    var projectDir: URL?
    
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
    
    private func handleProjectCreation(_ result: Result<URL, Error> ) {
        switch result {
        case .success(let url):
            projectDir = url
            Task {await createProject(from: url)}
        case .failure(let error):
            print(error)
        }
    }
    private func createProject(from url: URL) async {
        do {
            projectDir = try await ProjectCreator.createdir(from: url)
        }
        catch {
            print(error)
        }
    }
    
}
