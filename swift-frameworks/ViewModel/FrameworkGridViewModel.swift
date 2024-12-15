//
//  FrameworkGridViewModel.swift
//  swift-frameworks
//
//  Created by Jibryll Brinkley on 12/15/24.
//

import Foundation
import SwiftUI


final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
