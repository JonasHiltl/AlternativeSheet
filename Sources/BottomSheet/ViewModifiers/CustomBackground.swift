//
//  CustomBackground.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension BottomSheet {
    func customBackground<Background>(_ background: Background) -> BottomSheet where Background: View {
        self.config.backgroundView = AnyView(background)
        return self
    }
}
