//
//  Users_2.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct Users_2: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("Rate our app\nin the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 50)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Users_3(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                    }
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    Users_2(telegram: URL(string: "d")!, isTelegram: false)
}
