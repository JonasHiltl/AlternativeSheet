//
//  Animation.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension BottomSheet {
    func customAnimation(_ animation: Animation?) -> BottomSheet {
        self.config.animation = animation
        return self
    }
}
