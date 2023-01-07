//
//  CustomOverlay.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension AlternativeSheet {
    /// Changes the overlay that is placed behind the bottom sheet when the bottom sheet is presented.
    /// If `overlay` is not defined/nil the overlay will be removed.
    func customOverlay(_ overlay: (any View)?) -> AlternativeSheet {
        if let overlay = overlay {
            self.config.overlayView = AnyView(overlay)
        } else {
            self.config.overlayView = nil
        }
        return self
    }
}
