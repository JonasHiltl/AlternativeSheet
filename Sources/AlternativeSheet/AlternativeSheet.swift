//
//  BottomSheet.swift
//
//  Created by Jonas Hiltl on 30.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

public struct AlternativeSheet<Content: View, V: View>: View {
    @Binding var isPresented: Bool
    
    let snaps: [Double]
    let view: V
    let content: Content
    internal var config: AlternativeSheetConfig = AlternativeSheetConfig()

    public var body: some View {
        if snaps.count > 0 {
            ZStack {
                view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if isPresented == true {
                            config.onDismiss()
                            isPresented = false
                        }
                    }
                
                if isPresented {
                    if let overlay = config.overlayView {
                        overlay
                            .edgesIgnoringSafeArea(.all)
                            .allowsHitTesting(false)
                    }
                    
                    GeometryReader { proxy in
                        AlternativeSheetView(
                            isPresented: $isPresented,
                            proxy: proxy,
                            snaps: snaps,
                            config: config,
                            content: content
                        )
                    }
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                }
            }
            .animation(config.animation, value: isPresented)
        }
    }
}


public extension View {
    /// Adds a Bottom Sheet to the view.
    /// It's idfferent from the *native* one in that it doees not appear in a different window, but only has a zIndex of 1.
    /// - Parameters:
    ///   - isPresented: Whether to hide or show the sheet.
    ///   - snaps: Values between 1.0 and 0.0 specifying the snap points of the sheet.
    ///            The first snap point in the array is the initial height of the sheet.
    ///   - content: A closure that returns the content of the bottom sheet.
    func alternativeSheet<Content: View>(
        isPresented: Binding<Bool>,
        snaps: [Double],
        @ViewBuilder content: @escaping () -> Content
    ) -> AlternativeSheet<Content, Self> {
        AlternativeSheet(
            isPresented: isPresented,
            snaps: snaps,
            view: self,
            content: content()
        )
    }
}
