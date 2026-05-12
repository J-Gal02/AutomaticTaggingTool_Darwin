//
//  ProjectCreator.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import Foundation

struct ProjectCreator {
    
    private static let subfolders = ["audio", "exports", "subtitles", "videos"]
    
    static func create(name: String, in parentDirectory: URL) async throws -> Project {
        let folderURL = parentDirectory.appendingPathComponent(name)
        print("Attempting to create project at: \(folderURL.path)")
        
        try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
        print("Root folder created")
        
        for folder in subfolders {
            let subfolderURL = folderURL.appendingPathComponent(folder)
            try FileManager.default.createDirectory(at: subfolderURL, withIntermediateDirectories: true)
            print("Created subfolder: \(folder)")
        }
        
        //Create Project Struct
        let project = Project(
            name: name, directory: folderURL, createdAt: Date(), modifiedAt: Date(), mediaFiles: []
        )
        
        //Encode Struct to JSON
        let encoder = JSONEncoder()
        let data = try encoder.encode(project)
        
        //Write to JSON
        try data.write(to: folderURL.appendingPathComponent("project.json"))
        
        //Return Project
        
        return project
        
    }
}

