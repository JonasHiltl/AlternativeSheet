//
//  CustomCornerRadius.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension BottomSheet {
    
    /// Changes the corner radius of the bottom sheet.
    /// Default is 16.
    func customCornerRadius(_ radius: CGFloat) -> BottomSheet {
        self.config.cornerRadius = radius
        return self
    }
}
