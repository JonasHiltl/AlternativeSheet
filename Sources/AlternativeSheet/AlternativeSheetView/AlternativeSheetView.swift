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
    
    internal let config: AlternativeSheetConfig
    
    init(
        isPresented: Binding<Bool>,
        proxy: GeometryProxy,
        sortedSnaps: [Double],
        config: AlternativeSheetConfig,
        content: Content
    ) {
        self._isPresented = isPresented
        self.proxy = proxy
        self.sortedSnaps = sortedSnaps
        self.config = config
        self.content = content
        
        // set inital height to largest snap point
        self._offsetY = .init(initialValue: proxy.size.height * (1.0 - sortedSnaps[0]))
    }
    
    private var maxHeight: CGFloat {
        switch config.sheetType {
        case .fullscreen:
            return .infinity
        case .stretch:
            return proxy.size.height + proxy.safeAreaInsets.bottom - offsetY - translation

        }
    }

    var body: some View {
        content
        .frame(
            maxWidth: .infinity,
            maxHeight: maxHeight
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
