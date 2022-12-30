//
//  Draggable.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

public extension BottomSheet {
    
    /// Specifies whether the bottom sheet should be draggable.
    func isDraggable(_ bool: Bool = true) -> BottomSheet {
        self.config.isDraggable = bool
        return self
    }
}
