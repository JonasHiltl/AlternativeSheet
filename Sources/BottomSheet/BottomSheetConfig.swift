//
//  BottomSheetConfig.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import Foundation
import SwiftUI

public enum BottomSheetType {
    /// The sheet is as tall as the screen.
    case fullscreen
    /// The sheet height goes from the bottom of the screen to the top of the sheet.
    /// It also shrinks and stretchds when the sheet is dragged.
    case stretch
}

/// Specifies the maximum distance the sheet can be dragged while being damped.
public enum DampenLimit {
    /// Distance as percantage of screen.
    case relative(CGFloat)
    
    /// Distance in pixel.
    case fix(CGFloat)
}

internal class BottomSheetConfig {
    var animation: Animation? = .easeOut(duration: 0.2)
    var backgroundView: AnyView? = AnyView(Color.white)
    var cornerRadius: CGFloat = 16
    var dampenDrag: Bool = false
    var dampenLimit: DampenLimit = .relative(0.2)
    var isDraggable: Bool = false
    var onDismiss: () -> Void = {}
    var onDragEnded: (DragGesture.Value) -> Void = { _ in }
    var onDragChanged: (DragGesture.Value) -> Void = { _ in }
    var overlayView: AnyView? = AnyView(Color.black.opacity(0.3))
    var sheetType: BottomSheetType = .stretch
    var swipeToDismiss: Bool = true
}
