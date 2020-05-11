//
//  ContentView.swift
//  PageController
//
//  Created by Отажон on 5/10/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var currentPage = 0
    var body: some View {
        VStack{
            ZStack{
                if currentPage == 0{
                    Image("img1").resizable().frame(height: 350).cornerRadius(20).padding()
                }
                else if currentPage == 1{
                    Image("img2").resizable().frame(height: 350).cornerRadius(20).padding()
                }
                else if currentPage == 2{
                    Image("img3").resizable().frame(height: 350).cornerRadius(20).padding()
                }
                else {
                    Image("img4").resizable().frame(height: 350).cornerRadius(20).padding()
                }
            }
            
            pageControl(current: currentPage)
            
            HStack{
                Spacer()
                Button(action: {
                    if self.currentPage != 0{
                        self.currentPage -= 1
                    }
                    
                }){
                    Text("Previous")
                    }.disabled(currentPage == 0)
                    
                
                Spacer()
                Button(action: {
                    if self.currentPage < 4{
                        self.currentPage += 1
                    }
                    
                    
                }){
                    Text("Next")
                }.disabled(currentPage == 3)
                Spacer()
            }
            
            
        }.animation(.spring())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct pageControl : UIViewRepresentable{
    
    var current = 0
    func makeUIView(context: UIViewRepresentableContext<pageControl>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .black
        page.numberOfPages = 4
        page.pageIndicatorTintColor = .gray
        return page
    }
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        uiView.currentPage = current
        
    }
}
