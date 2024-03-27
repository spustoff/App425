//
//  TabBar.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white: .white.opacity(0.5))
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color.white : .white.opacity(0.5))
                            .font(.system(size: 12, weight: .regular))
                            .opacity(0)
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("primary"))
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case History = "History"
    
    case Settings = "Settings"
}


#Preview {
    
    ContentView()
}
