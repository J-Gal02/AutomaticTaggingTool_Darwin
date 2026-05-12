//
//  AudioExtractor.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import AVFoundation

struct AudioExtractor{
    static func extract(from videoURL: URL) async throws -> URL {
        print("Video URL at \(videoURL)")
        return videoURL
        
    }
}
