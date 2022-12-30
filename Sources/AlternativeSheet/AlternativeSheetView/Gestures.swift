//
//  Gestures.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import Foundation
import SwiftUI

internal extension AlternativeSheetView {
    func onDragChanged(value: DragGesture.Value) {
        config.onDragChanged(value)
        
        let offsetFromTop = value.translation.height + offsetY
        var limit: CGFloat {
            switch config.dampenLimit {
            case .relative(let perc):
                return proxy.size.height * perc
            case .fix(let dist):
                return dist
            }
        }
        
        // change the velocity of the drag when it's below/above max/min offset
        if (offsetFromTop < minimumOffsetFromTop() || offsetFromTop > maximumOffsetFromTop()) && config.dampenDrag {
            let dist = offsetFromTop < minimumOffsetFromTop()
            ? abs(minimumOffsetFromTop() - offsetFromTop)
            : abs(maximumOffsetFromTop() - offsetFromTop)
            
            let factor = 1 - 1 / (dist / limit + 1)
            
            if value.translation.height > 0 {
                translation = value.translation.height - dist * factor
            } else {
                translation = value.translation.height + dist * factor
            }
        } else {
            translation = value.translation.height
        }
    }
    
    func onDragEnded(value: DragGesture.Value) {
        config.onDragEnded(value)
        
        let height = proxy.size.height
        let offsetFromTop = translation + offsetY
        
        if offsetFromTop > maximumOffsetFromTop() && config.swipeToDismiss {
            // Swiped below minimal snap point, so we close the sheet
            closeSheet()
        } else if offsetFromTop < minimumOffsetFromTop() {
            // Ended above maximal snap point, so we snap to max snap point
            offsetY = height - (height * sortedSnaps[0])
        } else {
            // Check which snap is the closest
            for i in 0..<sortedSnaps.count {
                
                // The percentages are viewed from bottom perspective. Higher perc => greater height
                let snap = sortedSnaps[i]
                let topSnap = (i == 0) ? sortedSnaps[i] : sortedSnaps[i-1]
                let bottomSnap = (i == sortedSnaps.count-1) ? sortedSnaps[i] : sortedSnaps[i+1]
                
                let topRange = (snap + topSnap) / 2
                let bottomRange = (snap + bottomSnap) / 2
                
                // The offset from the top of the screen
                let topTrigger = height - height * topRange
                // The offset from the top of the screen, but further doen than topTrigger
                let bottomTrigger = height - (height * bottomRange)
                
                if offsetFromTop > topTrigger && offsetFromTop < bottomTrigger {
                    offsetY = height - (height * snap)
                }
            }
        }
        
        translation = .zero
    }
}

