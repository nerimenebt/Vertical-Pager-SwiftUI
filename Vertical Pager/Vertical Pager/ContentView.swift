//
//  ContentView.swift
//  Vertical Pager
//
//  Created by Nerimene on 31/5/2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    @State var currentPage = 1
    
    var body: some View {
        ScrollView(.init()) {
            TabView {
                GeometryReader { proxy in
                    let screen = proxy.frame(in: .global)
                    let offset = screen.maxX
                    let scale = 1 + (offset / screen.width)
                    
                    TabView(selection: $currentPage) {
                        ForEach(1...5, id: \.self) { item in
                            Image("img\(item)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: getRect().height)
                                .cornerRadius(1)
                                .modifier(VerticalTabBarModifier(screen: screen))
                                .tag(item)
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .rotationEffect(.init(degrees: 90))
                    .frame(width: screen.width + 550)
                    .scaleEffect(scale >= 0.88 ? scale : 0.88, anchor: .center)
                    .offset(x: -offset)
                    .blur(radius: (1 - scale) * 20)
                }.frame(width: getRect().width, height: getRect().height)
                DetailView(currentPage: $currentPage)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.background(Color.black.ignoresSafeArea())
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
