//
//  DragEvents.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension AlternativeSheet {
    /// Fired when the sheet gets closed.
    func onSheetDismissed(_ action: @escaping () -> Void) -> AlternativeSheet {
        self.config.onDismiss = action
        return self
    }
   
    /// Fired when dragging ended.
    func onDragEnded(_ action: @escaping (DragGesture.Value) -> Void) -> AlternativeSheet {
        self.config.onDragEnded = action
        return self
    }
   
    /// Fired on every drag change.
    func onDragChanged(_ action: @escaping (DragGesture.Value) -> Void) -> AlternativeSheet {
        self.config.onDragChanged = action
        return self
    }
}
