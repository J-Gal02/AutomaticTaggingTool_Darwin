//
//  ProjectLoader.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import Foundation

struct ProjectLoader {
    static func load(from folderURL: URL) async throws -> Project {
        let projectjson = folderURL.appendingPathComponent("project.json")
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: projectjson)
        
        var project = try decoder.decode(Project.self, from: data)
        
        if let bookmarkData = project.directoryBookmark {
            var isStale = false
            let resolvedURL = try URL(
                resolvingBookmarkData: bookmarkData,
                options: .withSecurityScope,
                relativeTo: nil,
                bookmarkDataIsStale: &isStale
            )
            let accessing = resolvedURL.startAccessingSecurityScopedResource()
            if !accessing {
                print("Failed to access security scoped resource")
            }
            project.directory = resolvedURL
            
            if isStale {
                print("Bookmark is stale, user may need to reselect the folder")
            }
        }
        
        return project
    }
}
