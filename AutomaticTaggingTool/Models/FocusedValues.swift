//
//  FocusedValues.swift
//  AutomaticTaggingTool
//
//  Created by jared on 12/5/2026.
//

import SwiftUI

struct ProjectViewModelKey: FocusedValueKey {
    typealias Value = ProjectViewModel
}

extension FocusedValues {
    @Entry var projectViewModel: ProjectViewModel?
}
