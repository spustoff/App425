//
//  HomeView.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
    
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Home")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack(alignment: .top) {
                    
                    VStack(spacing: 20) {
                        
                        Text("2024")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("January     0$")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("February     0$")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("March     0$")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("April      0$")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("$\(viewModel.items.map(\.price).reduce(0,+))")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                    
                    VStack {
                        
                        Button(action: {
                            
                            viewModel.isGraph = true
                            
                        }, label: {
                            
                            VStack {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Image(systemName: "pencil")
                                        .foregroundColor(Color("primary"))
                                }
                                
                                VStack(alignment: .center, spacing: 15, content: {
                                    
                                    Image("eurusd")
                                    
                                    Text("EUR/USD")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                })
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("primary")))
                        })
                        
                        Button(action: {
                            
                            viewModel.isAdd = true
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        })
                    }
                }
                .padding([.horizontal, .bottom])
                
                if viewModel.items.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                            .multilineTextAlignment(.center)
                            
                        Text("You haven't added any subscriptions yet")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding([.horizontal, .bottom])
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.items, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text(index.title ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .medium))
                                    })
                                    
                                    Spacer()
                                    
                                    Text("\((index.startDate ?? Date()).convertDate(format: "MMM d Y"))")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(7)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary").opacity(0.2)))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchItems()
        }
        .sheet(isPresented: $viewModel.isGraph, content: {
            
            HomeGraph()
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            HomeAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
