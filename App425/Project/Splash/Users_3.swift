//
//  Users_3.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            Image("users_3")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("Join and Earn")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 40)
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 163/255, blue: 255/255)))
                        .padding()
                })
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Users_3(telegram: URL(string: "d")!)
}
