//
//  DetailView.swift
//  Vertical Pager
//
//  Created by Nerimene on 31/5/2021.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var currentPage: Int
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Details")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, edges?.top ?? 15)
            
            Image("img\(currentPage)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(20)
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Hope 🌸")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("By Neri")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }).frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            
            Button(action: {}, label: {
                Text("Download Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red, lineWidth: 1.5)
                    )
            }).padding(.vertical)
            
            Button(action: {}, label: {
                Text("Report Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.red, lineWidth: 1.5)
                    )
            })
            Spacer()
        }.padding()
        .background(Color.black).ignoresSafeArea()
    }
}
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
var edges = UIApplication.shared.windows.first?.safeAreaInsets
