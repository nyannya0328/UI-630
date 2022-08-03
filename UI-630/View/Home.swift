//
//  Home.swift
//  UI-630
//
//  Created by nyannyan0328 on 2022/08/03.
//

import SwiftUI

struct Home: View {
    @State var offset : CGFloat = 0
    @State var currentTab : Tab = sampleTabs.first!
    
    @State var isTapped : Bool = false
    
    
    var body: some View {
        GeometryReader{proxy in
            
            let screenSize = proxy.size
            
            ZStack(alignment:.top){
                
                TabView(selection: $currentTab) {
                    
                    
                    ForEach(sampleTabs){tab in
                        
                        GeometryReader{proxy in
                            
                             let size = proxy.size
                            
                            Image(tab.sampleImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width,height: size.height)
                                .clipped()
                            
                        }
                        .ignoresSafeArea()
                        .offsetX(cometition: { value in
                            
                            
                            if currentTab == tab && !isTapped{
                                
                                offset = value - (screenSize.width * CGFloat(indexOffset(tab: tab)))
                                
                                
                            }
                            
                            if value == 0 && isTapped{
                                isTapped = false
                                
                                
                            }
                            
                    
                        })
                        .tag(tab)
                    }
                   
                    
                    
                }
               
                .ignoresSafeArea()
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
                DynamicHederView(size: screenSize)
                
                
            }
            .frame(width: screenSize.width,height: screenSize.height)
        }
    }
    
    @ViewBuilder
    func DynamicHederView(size : CGSize) -> some View{
        
        VStack(alignment: .leading) {
            
              Text("Dynamic Tab")
                .font(.title.smallCaps())
                .foregroundColor(.white)
            
            HStack(spacing:0){
                
                ForEach(sampleTabs){tab in
                    
                    Text(tab.tabName)
                        .fontWeight(.ultraLight)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(.vertical,10)
                        .foregroundColor(.white)
                     
                        
                }
                
            }
            .overlay(alignment: .leading) {
                
                Capsule()
                    .fill(.white)
                    .overlay(alignment: .leading) {
                        
                        GeometryReader{_ in
                            
                            
                            HStack(spacing:0){
                                
                                ForEach(sampleTabs){tab in
                                    
                                    Text(tab.tabName)
                                        .fontWeight(.bold)
                                     
                                        .frame(maxWidth: .infinity,alignment: .center)
                                        .padding(.vertical,5)
                                        .foregroundColor(.black)
                                        .contentShape(Capsule())
                                        .onTapGesture {
                                            
                                            
                                            withAnimation(.interpolatingSpring(stiffness: 250, damping: 30)){
                                                
                                                isTapped = true
                                                currentTab = tab
                                                offset = -(size.width) * CGFloat(indexOffset(tab: tab))
                                                
                                            }
                                        }
                                        
                                    
                                }
                                
                            }
                            .offset(x:-tabOffset(size: size, padding: 30))
                            
                        }
                        .frame(width:size.width - 30)
                        
                        
                    }
                    .frame(width:(size.width - 30) / CGFloat(sampleTabs.count))
                    .mask {
                        
                        Capsule()
                    }
                    .offset(x:tabOffset(size: size, padding: 30))
                
                
            }
            
        }
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding(15)
          .background{
           
              
              Rectangle()
                  .fill(.ultraThinMaterial)
                  .environment(\.colorScheme, .dark)
                  .ignoresSafeArea()
          }
        
        
    }
    
    func tabOffset(size : CGSize,padding : CGFloat) -> CGFloat{
        
        
        return (-offset / size.width) * ((size.width - padding) / CGFloat(sampleTabs.count))
        
    }
    
    func indexOffset(tab : Tab)->Int{
        
        let index = sampleTabs.firstIndex { CAB in
             CAB == tab
        } ?? 0
        
        return index
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
