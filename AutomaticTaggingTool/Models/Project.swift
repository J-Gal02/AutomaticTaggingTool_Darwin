//
//  Project.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import Foundation

struct Project: Codable, Hashable {
    var name: String
    var directory: URL
    var directoryBookmark: Data?
    var createdAt: Date
    var modifiedAt: Date
    var mediaFiles: [MediaFile]
}
