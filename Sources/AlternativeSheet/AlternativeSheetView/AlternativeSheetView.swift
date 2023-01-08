//
//  BottomSheetView.swift
//
//  Created by Jonas Hiltl on 27.12.22.
//  Copyright © 2022 Jonas Hiltl. All rights reserved.
//

import SwiftUI

internal struct AlternativeSheetView<Content: View>: View {
    @Binding private var isPresented: Bool
    
    /// the offset from the last snapped position
    @State internal var translation: CGFloat = .zero
    
    /// The offset from the top of the screen
    @State internal var offsetY: CGFloat
    
    private let content: Content
    internal let proxy: GeometryProxy
    internal let sortedSnaps: [Double]
    
    /// the first snap in the snap array is the initial height of the sheet
    internal let firstSnap: Double
    
    internal let config: AlternativeSheetConfig
    
    init(
        isPresented: Binding<Bool>,
        proxy: GeometryProxy,
        snaps: [Double],
        config: AlternativeSheetConfig,
        content: Content
    ) {
        self._isPresented = isPresented
        self.proxy = proxy
        self.sortedSnaps = snaps.sorted { (lhs, rhs) in
            return rhs < lhs
        }
        self.firstSnap = snaps[0]
        self.config = config
        self.content = content
        
        // set inital height to largest snap point
        self._offsetY = .init(initialValue: proxy.size.height * (1.0 - firstSnap))
    }
    
    private var maxHeight: CGFloat {
        switch config.sheetType {
        case .fullscreen:
            return .infinity
        case .stretch:
            return max(proxy.size.height + proxy.safeAreaInsets.bottom - offsetY - translation, 0)
        }
    }

    var body: some View {
        content
        .frame(
            maxWidth: .infinity,
            maxHeight: maxHeight,
            alignment: .top
        )
        .background(config.backgroundView)
        .cornerRadius(config.cornerRadius, corners: [.topLeft, .topRight])
        .offset(y: max(offsetY + self.translation, 0))
        .edgesIgnoringSafeArea(.bottom)
        .gesture(
            config.isDraggable
                ? DragGesture()
                .onChanged { value in
                    onDragChanged(value: value)
                }
                .onEnded { value in
                    withAnimation(config.animation) {
                        onDragEnded(value: value)
                    }
                }
                : nil
            )
    }
}

internal extension AlternativeSheetView {
    func closeSheet() {
        config.onDismiss()
        isPresented = false
    }
}
