//
//  CustomOverlay.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension AlternativeSheet {
    /// Changes the overlay that is placed behind the bottom sheet when the bottom sheet is presented.
    /// Default is `Color.black.opacity(0.3)`
    func customOverlay<Overlay>(_ overlay: Overlay) -> AlternativeSheet where Overlay: View {
        self.config.overlayView = AnyView(overlay)
        return self
    }
}
