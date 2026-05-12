//
//  ProjectLoader.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import Foundation

struct ProjectLoader {
    static func load(from folderURL: URL) async throws -> Project {
        //Build path
        let projectjson = folderURL.appendingPathComponent("project.json")
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: projectjson)
        
        let project = try decoder.decode(Project.self, from: data)
        
        return project
        
    }
}
