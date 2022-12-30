//
//  DamenDrag.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

public extension AlternativeSheet {
    /// Specifies whether the drag should be damped above/below the min/max drag height.
    func dampenDrag(_ bool: Bool = true) -> AlternativeSheet {
        self.config.dampenDrag = bool
        return self
    }
   
    /// Specifies the limit of the damping.
    func dampenLimit(_ limit: DampenLimit) -> AlternativeSheet {
        self.config.dampenLimit = limit
        return self
    }
}
