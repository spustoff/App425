//
//  Users_4.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI
import OneSignalFramework

struct Users_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            Image("users_4")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                       status = true
                        
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
    Users_4()
}
