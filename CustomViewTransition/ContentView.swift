//
//  ContentView.swift
//  CustomViewTransition
//
//  Created by Ayhan on 4.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModel = false
    
    var body: some View {
        ZStack{
            Image("BG")
                .resizable()
                .ignoresSafeArea()
            
            Button(action: { showModel = true }){
                Text("Click Me")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                    .background(Color.black.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .offset(y: -100)
            
            ModelView(isShowing: $showModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
