//
//  Animation.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public extension AlternativeSheet {
    func customAnimation(_ animation: Animation?) -> AlternativeSheet {
        self.config.animation = animation
        return self
    }
}
