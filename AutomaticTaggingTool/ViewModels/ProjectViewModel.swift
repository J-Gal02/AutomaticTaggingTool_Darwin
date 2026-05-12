//
//  ProjectViewModel.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

@Observable
class ProjectViewModel {
    var videoURL: URL?
    var audioURL: URL?
    var isProcessing = false
    
    func handleFileSelection(_ result: Result<URL, Error>) {
        switch result {
        case .success(let url):
            videoURL = url
            Task {await AudioExtractor.extract(from: url) }
        case .failure(let error):
            print(error)
        }
    }
    
    
}
