//
//  MediaImporter.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import Foundation
import UniformTypeIdentifiers

enum ImportError: Error {
    case unsupportedFileType
}

struct MediaImporter {
    static func `import`(file: URL, into project: Project) throws {
        let type = UTType(filenameExtension: file.pathExtension)
        var destination: URL
        
        

        if type?.conforms(to: .audio) == true {
            destination = project.directory.appendingPathComponent("audio")
        } else if type?.conforms(to: .movie) == true || type?.conforms(to: .audiovisualContent) == true {
            destination = project.directory.appendingPathComponent("videos")
        } else if ["srt", "ass", "vtt"].contains(file.pathExtension.lowercased()) {
            destination = project.directory.appendingPathComponent("subtitles")
        } else {
            throw ImportError.unsupportedFileType
        }
        
        let destFile = destination.appendingPathComponent(file.lastPathComponent)
        try FileManager.default.copyItem(at: file, to: destFile)
    }
}
