//
//  VerticalTabBarModifier.swift
//  Vertical Pager
//
//  Created by Nerimene on 31/5/2021.
//

import SwiftUI

struct VerticalTabBarModifier: ViewModifier {
    
    var screen: CGRect
    
    func body(content: Content) -> some View {
        return content
            .frame(width: screen.width, height: screen.height)
            .rotationEffect(.init(degrees: -90))
            .frame(width: screen.height, height: screen.width)
    }
}

