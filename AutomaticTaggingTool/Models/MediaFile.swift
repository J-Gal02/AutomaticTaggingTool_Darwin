//
//  MediaFile.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import Foundation

enum MediaFile: Codable, Hashable {
    case video(URL)
    case audio(URL)
    case subtitle(URL)
}
