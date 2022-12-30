//
//  SheetType.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension BottomSheet {
    
    /// Changes the type of the bottom sheet, default is `.stretch`.
    /// This will modify the height of the sheet, either stretches from bottom of screen to top of sheet or has height of the fullscreen.
    func sheetType(_ type: BottomSheetType) -> BottomSheet {
        self.config.sheetType = type
        return self
    }
}
