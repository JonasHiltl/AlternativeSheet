//
//  Calculations.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import Foundation

internal extension BottomSheetView {
    /// Calculates the height of the max snap point.
    func maxSnapHeight() -> CGFloat {
        return proxy.size.height * sortedSnaps[0]
    }
   
    /// Calculates the height of the min snap point.
    func minSnapHeight() -> CGFloat {
        return proxy.size.height * sortedSnaps[sortedSnaps.count-1]
    }
   
    /// Calculates the minimal offset from the top.
    func minimumOffsetFromTop() -> CGFloat {
        return proxy.size.height - maxSnapHeight()
    }
   
    /// Calculates the maximal offset from the top.
    func maximumOffsetFromTop() -> CGFloat {
        return proxy.size.height - minSnapHeight()
    }
}
