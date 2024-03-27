//
//  Reviewers_2.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct Reviewers_2: View {
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("All courses in one place")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("It is convenient to track in one place")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 50)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_3()
                        .navigationBarBackButtonHidden()
                    
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
    Reviewers_2()
}
