//
//  ModelView.swift
//  CustomViewTransition
//
//  Created by Ayhan on 4.06.2022.
//

import SwiftUI

struct ModelView: View {
    
    @Binding var isShowing: Bool
    @State private var curHeight: CGFloat = 400
    
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    var body: some View {
        ZStack(alignment: .bottom){
        if isShowing{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeIn)
    }
    var mainView: some View{
        VStack{
            
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack{
                VStack{
                    Text("\"Hi👋🏻 welcome to my video\"")
                        .font(.system(size: 22, weight: .regular))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
                    
                    Text("eyh.dev")
                        .font(.system(size: 20, weight: .light))
                }
                .padding(.horizontal, 30)
                }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    Rectangle()
                    .frame(height: curHeight / 2)
            }
            
                .foregroundColor(.white))
    }
    
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                }else{
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
       }
    }
}

struct ModelView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
